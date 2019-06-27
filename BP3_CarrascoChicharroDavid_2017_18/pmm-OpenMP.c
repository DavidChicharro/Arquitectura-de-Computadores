/* pmm-OpenMP.c
	Multiplica dos matrices cuadradas

	Para compilar usar (-lrt: real time library)
	gcc -O2 -fopenmp pmm-OpenMP.c -o pmm-OpenMP -lrt

	Para ejecutar use: pmm-OpenMP tamaño
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

   if(argc < 2){
   	fprintf(stderr,"Falta el tamaño\n");
   	exit(-1);
 	}

   unsigned int N = atoi(argv[1]);
   int fil, col, chunk;
   omp_sched_t kind;


   long long unsigned int **M1, **M2, **M3;
   M1 = (long long unsigned int**) malloc(N*sizeof(long long unsigned int*));
   M2 = (long long unsigned int**) malloc(N*sizeof(long long unsigned int*));
   M3 = (long long unsigned int**) malloc(N*sizeof(long long unsigned int*));
   for(long long unsigned int i=0 ; i<N ; i++){
   	M1[i] = (long long unsigned int*) malloc(N*sizeof(long long unsigned int));
   	M2[i] = (long long unsigned int*) malloc(N*sizeof(long long unsigned int));
   	M3[i] = (long long unsigned int*) malloc(N*sizeof(long long unsigned int));
   }

  	if ( (M1==NULL) || (M2==NULL) || (M3==NULL) ){  
   	printf("Error en la reserva de espacio para las matrices\n");
   	exit(-2);
 	}

   #pragma omp parallel
   {
   	// Inicialización de las matrices
   	#pragma omp for firstprivate(col) schedule(runtime)
   	for(fil=0 ; fil<N ; fil++)
	   	for(col=0 ; col<N ; col++){
	      	M1[fil][col]=fil+col;
	      	M2[fil][col]=fil+col;
	      	M3[fil][col]=0;
	   	}

      #pragma omp single
      t_ini = omp_get_wtime();

      #pragma omp for schedule(runtime)
	   for (int i=0 ; i<N; i++)
			for(int j=0 ; j<N ; j++)
				for(int k=0 ; k<N ; k++)
					M3[i][j] += M1[i][k] * M2[k][j];

		#pragma omp single
      {
         t_fin = omp_get_wtime();
         //omp_get_schedule(&kind, &chunk);
         //printf(" run-sched-var:%d, chunk:%d \n", kind, chunk);
      }
   }

   t_elapsed = t_fin - t_ini;


   printf("Tiempo(seg.):%11.9f\t / Tamaño Matrices:%u\n",t_elapsed,N);
	printf("M3[0][0]=%llu , M3[%d][%d]=%llu \n", \
		M3[0][0], N-1, N-1, M3[N-1][N-1]);	

	for(int i=0 ; i<N ; i++){
		free(M1[i]);
		free(M2[i]);
		free(M3[i]);
	}
	free(M1);	free(M2);	free(M3);

	return 0;
}
