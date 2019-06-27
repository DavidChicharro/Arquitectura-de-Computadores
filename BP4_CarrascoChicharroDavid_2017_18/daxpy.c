/*	daxpy.c
	multiplica un vector por una constante y los suma a otro vector 

	Para compilar usar (-lrt: real time library)
	gcc -Ox daxpy.c -o daxpy -lrt

	Para ejecutar use: ./daxpy
*/

#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h>   // biblioteca donde se encuentra la función clock_gettime() 


int main(int argc, char **argv) {

	if(argc < 3){
		fprintf(stderr,"Falta el tamaño y la constante\n");
		exit(-1);
	}

	struct timespec cgt1,cgt2; 
	double ncgt; //para tiempo de ejecución

	unsigned int N = atoi(argv[1]);	if(N>200000000) N=200000000;
	unsigned int a = atoi(argv[2]);
	unsigned int i;

	long long unsigned int *x, *y;
   x = (long long unsigned int*) malloc(N*sizeof(long long unsigned int));
   y = (long long unsigned int*) malloc(N*sizeof(long long unsigned int));

	if ( (x==NULL) || (y==NULL) ){  
		printf("Error en la reserva de espacio para las matrices\n");
		exit(-2);
 	}

	// Inicialización del vector
	for(i=0;i<N;i++)  x[i] = i;

	clock_gettime(CLOCK_REALTIME,&cgt1);
	// Cómputos
	for (i=0;i<N;i++) y[i]= a*x[i] + y[i];
	
	clock_gettime(CLOCK_REALTIME,&cgt2);
   ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
     (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("Tiempo(seg.):%11.9f\t / Tamaño de N:%u\n",ncgt,N);

	free(x);
	free(y);

	return 0;
}