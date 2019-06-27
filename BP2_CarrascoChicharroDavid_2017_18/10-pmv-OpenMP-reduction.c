#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h>   // biblioteca donde se encuentra la función clock_gettime() 

#ifdef _OPENMP
  #include <omp.h>    // biblioteca para usar OpenMP 
#else
  #define omp_get_thread_num() 0
  #define omp_get_num_threads() 1
#endif

//#define VERSION_GLOBAL
#define VERSION_DYNAMIC

#ifdef VERSION_GLOBAL
#define MAX 33554432//23000
int M[MAX][MAX], v1[MAX], v2[MAX];
#endif

int main(int argc, char **argv) {

	double t_ini, t_fin, t_elapsed;

   if(argc < 2){
   	fprintf(stderr,"Falta el tamaño\n");
   	exit(-1);
 	}

   unsigned int N = atoi(argv[1]);
   int fil, col, suma;

   #ifdef VERSION_GLOBAL
   if (N>MAX) N=MAX;
   #endif

   #ifdef VERSION_DYNAMIC
   long long unsigned int **M, *v1, *v2;
   M = (long long unsigned int**) malloc(N*sizeof(long long unsigned int*));
   for(long long unsigned int i=0 ; i<N ; i++)
   	M[i] = (long long unsigned int*) malloc(N*sizeof(long long unsigned int));

   v1 = (long long unsigned int*) malloc(N*sizeof(long long unsigned int));
   v2 = (long long unsigned int*) malloc(N*sizeof(long long unsigned int));

  	if ( (M==NULL) || (v1==NULL) || (v2==NULL) ){  
   	printf("Error en la reserva de espacio para los vectores\n");
   	exit(-2);
 	}
   #endif

   // Inicialización de la matriz y los vectores
  	for(fil=0 ; fil<N ; fil++){
		#pragma omp parallel for
		for(int col=0 ; col<N ; col++)
   		M[fil][col]=fil+col;

   	v1[fil]=fil;
   	v2[fil]=0;
	}

	t_ini = omp_get_wtime();

   // Cálculo de v2
   for (fil=0 ; fil<N; fil++){
		suma=0;
		#pragma omp parallel
		{
	   	#pragma omp for reduction(+:suma)
			for(col=0 ; col<N ; col++)
				suma += M[fil][col]*v1[col];

			v2[fil] = suma;		
		}
   }

   t_fin = omp_get_wtime();
  	t_elapsed = t_fin - t_ini;


   printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",t_elapsed,N);
   /*if(N<20)
	   for(fil=0 ; fil<N ; fil++){
	   	printf("V2[%d]=%llu  ", fil, v2[fil]);
	   }
	else{
		printf("V2[0]=%llu  ", v2[0]);
		printf("V2[%d]=%llu  ", N-1, v2[N-1]);
	}*/
   printf("\n");

	#ifdef VERSION_DYNAMIC
	for(int i=0 ; i<N ; i++)
		free(M[i]);
	free(M);
	free(v1);
	free(v2);
	#endif

  return 0;
}
