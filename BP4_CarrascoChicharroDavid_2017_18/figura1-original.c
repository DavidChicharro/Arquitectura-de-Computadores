/* figura1-original.c

	Para compilar usar (-lrt: real time library)
	gcc -O2 figura1-original.c -o figura1-original -lrt

	Para ejecutar use: figura1-original
*/

#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h>   // biblioteca donde se encuentra la función clock_gettime() 

struct {
	int a;
	int b;
} s[5000];

int main(){
	struct timespec cgt1,cgt2; 
	double ncgt; //para tiempo de ejecución
	int ii, i, X1, X2;
	long long unsigned int R[40000];

	// Inicialización
	for(int k=0 ; k<5000 ; k++){
		s[k].a = k;
		s[k].b = k;

		//printf("s[%d].a=%d\n s[%d].b=%d\n",k,s[k].a,s[k].b,k);
	}

	// Cómputos
	clock_gettime(CLOCK_REALTIME,&cgt1);

	for(ii=0 ; ii<40000 ; ii++){
		X1=0; X2=0;
		for(i=0 ; i<5000 ; i++)
			X1 += 2*s[i].a + ii;
		for(i=0 ; i<5000 ; i++)
			X2 += 3*s[i].b - ii;

		if(X1<X2)
			R[ii]=X1;
		else
			R[ii]=X2;
	}

	clock_gettime(CLOCK_REALTIME,&cgt2);
   ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
     (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));


	printf("Tiempo(seg.):%11.9f \n",ncgt);
	printf("R[0]=%llu\t R[39999]=%llu\n",R[0],R[39999]);

	return 0;
}