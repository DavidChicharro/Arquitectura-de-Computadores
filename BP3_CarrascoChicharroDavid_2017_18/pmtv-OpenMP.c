/* pmtv-OpenMP.c
	Multiplica una matriz triangular y un vector

	Para compilar usar (-lrt: real time library)
	gcc -O2 -fopenmp pmtv-OpenMP.c -o pmtv-OpenMP -lrt

	Para ejecutar use: pmtv-OpenMP longitud
*/

#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h>   // biblioteca donde se encuentra la función clock_gettime() 

#ifdef _OPENMP
  #include <omp.h>    // biblioteca para usar OpenMP 
#else
  #define omp_get_thread_num() 0
  #define omp_get_num_threads() 1
#endif

int main(int argc, char **argv) {

   double t_ini, t_fin, t_elapsed; //para tiempo de ejecución

   if(argc < 2) {
      fprintf(stderr,"\nFalta iteraciones\n");
      exit(-1);
   }

   int fil, col, suma, chunk;
   unsigned int N = atoi(argv[1]);
   omp_sched_t kind;

   long long unsigned int **M, *v1, *v_res;
   M = (long long unsigned int**) malloc(N*sizeof(long long unsigned int*));
   for(long long unsigned int i=0 ; i<N ; i++)
   	M[i] = (long long unsigned int*) malloc(N*sizeof(long long unsigned int));

   v1 = (long long unsigned int*) malloc(N*sizeof(long long unsigned int));
   v_res = (long long unsigned int*) malloc(N*sizeof(long long unsigned int));

  	if ( (M==NULL) || (v1==NULL) || (v_res==NULL) ){  
   	printf("Error en la reserva de espacio para los vectores\n");
   	exit(-2);
 	}

   // Inicialización de la matriz y los vectores
   for(fil=0 ; fil<N ; fil++)
   	for(int col=0 ; col<N ; col++)
      	M[fil][col]=0;
   for(fil=0 ; fil<N ; fil++){
   	for(int col=fil ; col<N ; col++)
      	M[fil][col]=fil+col;

   	v1[fil]=fil;
   	v_res[fil]=0;
   }

   #pragma omp parallel
   {
      #pragma omp single
      t_ini = omp_get_wtime();

      #pragma omp for firstprivate(suma) schedule(runtime)
         for (fil=0 ; fil<N; fil++){
            suma=0;
            for(col=fil ; col<N ; col++)
               suma += M[fil][col] * v1[col];

      		v_res[fil] = suma;
         }

      #pragma omp single
      {
         t_fin = omp_get_wtime();
         omp_get_schedule(&kind, &chunk);
         printf(" run-sched-var:%d, chunk:%d \n", kind, chunk);
      }
   }
   
   t_elapsed = t_fin - t_ini;

   printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",t_elapsed,N);
   if(N<20)
	   for(fil=0 ; fil<N ; fil++){
	   	printf("v_res[%d]=%llu  ", fil, v_res[fil]);
	   }
	else{
		printf("v_res[0]=%llu  ", v_res[0]);
		printf("v_res[%d]=%llu  ", N-1, v_res[N-1]);
	}
   printf("\n");

	for(int i=0 ; i<N ; i++)
   	free(M[i]);
	free(M);
	free(v1); // libera el espacio reservado para v1
	free(v_res); // libera el espacio reservado para v_res

	return 0;
}
