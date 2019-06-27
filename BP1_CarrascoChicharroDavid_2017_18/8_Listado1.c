/* SumaVectoresC.c 
 Suma de dos vectores: v3 = v1 + v2
 
 Para compilar usar (-lrt: real time library):  
	gcc -O2 -fopenmp -o Listado1_ej8 Listado1_ej8.c

 Para ejecutar use: Listado1_ej8 longitud
*/ 

#include <stdlib.h>
#include <stdio.h>

#ifdef _OPENMP
  #include <omp.h>	  // biblioteca para usar OpenMP 
#else
  #define omp_get_thread_num() 0
  #define omp_get_num_threads() 1
#endif
//#define PRINTF_ALL

#define VECTOR_GLOBAL
#define MAX 33554432	  //=2^25

double v1[MAX], v2[MAX], v3[MAX]; 

 
int main(int argc, char** argv){  
  int i, j, k, l;
  double t_ini, t_fin, t_elapsed; //para tiempo de ejecución

  //Leer argumento de entrada (nº de componentes del vector)
  if (argc<2){	
    printf("Faltan nº componentes del vector\n");
    exit(-1);
  }
  
  unsigned int N = atoi(argv[1]);

  if (N>MAX) N=MAX;
 
  //Inicializar vectores 
  #pragma omp parallel sections
  {
    #pragma omp section
    for(i=0; i<N/4; i++){ 
      v1[i] = N*0.1+i*0.1; 
      v2[i] = N*0.1-i*0.1;
    }

    #pragma omp section
    for(j=N/4; j<N/2; j++){ 
      v1[j] = N*0.1+j*0.1; 
      v2[j] = N*0.1-j*0.1;
    }

    #pragma omp section
    for(k=N/2; k<3*N/4; k++){ 
      v1[k] = N*0.1+k*0.1; 
      v2[k] = N*0.1-k*0.1;
    }

    #pragma omp section
    for(l=3*N/4; l<N; l++){ 
      v1[l] = N*0.1+l*0.1; 
      v2[l] = N*0.1-l*0.1;
    }
  }

  t_ini = omp_get_wtime();
 
  #pragma omp parallel sections
  {
    #pragma omp section
    for(i=0; i<N/4; i++)
      v3[i] = v1[i] + v2[i];

    #pragma omp section
    for(j=N/4; j<N/2; j++)
      v3[j] = v1[j] + v2[j];

    #pragma omp section
    for(k=N/2; k<3*N/4; k++)
      v3[k] = v1[k] + v2[k];
    
    #pragma omp section
    for(l=3*N/4; l<N; l++)
      v3[l] = v1[l] + v2[l];
  }
 
  t_fin = omp_get_wtime();
  t_elapsed = t_fin - t_ini;


  //Imprimir resultado de la suma y el tiempo de ejecución
  #ifdef PRINTF_ALL
  printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",t_elapsed,N); 
  for(i=0; i<N; i++) 
    printf("/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",
      i,i,i,v1[i],v2[i],v3[i]);
  #else
    printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",t_elapsed,N);
    for (int i=0; i<N ; i++)
      printf("V1[%d]+V2[%d]=V3[%d] \t(%8.6f+%8.6f=%8.6f)\n",
        i,i,i,v1[i],v2[i],v3[i]);
  #endif

  return 0; 
}
