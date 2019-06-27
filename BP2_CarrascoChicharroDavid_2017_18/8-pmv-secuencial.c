/* pmv-secuencial.c
	Multiplica una matriz y un vector

	Para compilar usar (-lrt: real time library)
	gcc -O2 8-pmv-secuencial.c -o pmv-secuencial -lrt

	Para ejecutar use: pmv-secuencial longitud
*/

#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h>   // biblioteca donde se encuentra la función clock_gettime() 

//#define VERSION_GLOBAL
#define VERSION_DYNAMIC

#ifdef VERSION_GLOBAL
#define MAX 33554432//23000
int M[MAX][MAX], v1[MAX], v2[MAX];
#endif

int main(int argc, char **argv) {

  struct timespec cgt1,cgt2; 
  double ncgt; //para tiempo de ejecución

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
   	for(int col=0 ; col<N ; col++)
      	M[fil][col]=fil+col;

   	v1[fil]=fil;
   	v2[fil]=0;
   }

   clock_gettime(CLOCK_REALTIME,&cgt1);
   // Cálculo de v2
   for (fil=0 ; fil<N; fil++){
		suma=0;
		for(col=0 ; col<N ; col++)
			suma += M[fil][col] * v1[col];

		v2[fil] = suma;
   }

   clock_gettime(CLOCK_REALTIME,&cgt2);
    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
      (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

   printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",ncgt,N);
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
  free(v1); // libera el espacio reservado para v1
  free(v2); // libera el espacio reservado para v2
  #endif

  return 0;
}
