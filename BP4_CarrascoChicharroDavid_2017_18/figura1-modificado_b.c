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
	int ii, i, X1, X2, X3, X4, X5, X6, X7, X8;
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
		for(i=0 ; i<5000 ; i+=4){
			X1 += 2*s[i].a + ii;
			X2 += 2*s[i+1].a + ii+1;
			X3 += 2*s[i+2].a + ii+2;
			X4 += 2*s[i+3].a + ii+3;
		}
		for(i=0 ; i<5000 ; i+=4){
			X5 += 3*s[i+1].b - ii;
			X6 += 3*s[i+1].b - ii+1;
			X7 += 3*s[i+1].b - ii+2;
			X8 += 3*s[i+1].b - ii+3;
		}

		if(X1<X5)
			R[ii]=X1;
		else
			R[ii]=X5;

		if(X2<X6)
			R[ii]=X2;
		else
			R[ii]=X6;

		if(X3<X7)
			R[ii]=X3;
		else
			R[ii]=X7;

		if(X4<X8)
			R[ii]=X4;
		else
			R[ii]=X8;

	}

	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
     (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));


	printf("Tiempo(seg.):%11.9f \n",ncgt);
	printf("R[0]=%llu\t R[39999]=%llu\n",R[0],R[39999]);

	return 0;
}