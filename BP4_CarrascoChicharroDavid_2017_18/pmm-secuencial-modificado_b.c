/* pmm-secuencial-modificado_b.c
   Multiplica dos matrices cuadradas

   Para compilar usar (-lrt: real time library)
   gcc -O2 pmm-secuencial-modificado_b.c -o pmm-secuencial-modificado_b -lrt

   Para ejecutar use: pmm-secuencial-modificado_b longitud
*/

#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h>   // biblioteca donde se encuentra la función clock_gettime() 


int main(int argc, char **argv) {

	struct timespec cgt1,cgt2; 
	double ncgt; //para tiempo de ejecución

   if(argc < 2){
   	fprintf(stderr,"Falta el tamaño\n");
   	exit(-1);
 	}

   unsigned int N = atoi(argv[1]);
   int fil, col;

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

   // Inicialización de las matrices
   for(fil=0 ; fil<N ; fil++)
   	for(col=0 ; col<N ; col++){
      	M1[fil][col]=fil+col;
      	M2[fil][col]=fil+col;
      	M3[fil][col]=0;
   	}

   clock_gettime(CLOCK_REALTIME,&cgt1);
   // Cálculo de M3
   for (int i=0 ; i<N; i++)
      for(int k=0 ; k<N ; k++)
         for(int j=0 ; j<N ; j++)
				M3[i][j] += M1[i][k] * M2[k][j];


   clock_gettime(CLOCK_REALTIME,&cgt2);
   ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
     (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

   printf("Tiempo(seg.):%11.9f\t / Tamaño Matrices:%u\n",ncgt,N);
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
