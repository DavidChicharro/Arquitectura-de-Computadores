/* SumaVectoresC.c 
 Suma de dos vectores: v3 = v1 + v2
 
 Para compilar usar (-lrt: real time library):  
	gcc -O2 -fopenmp -o Listado1_ej7 Listado1_ej7.c

 Para ejecutar use: Listado1_ej7 longitud
*/ 

#include <stdlib.h>	// biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()

#ifdef _OPENMP
  #include <omp.h>	  // biblioteca para usar OpenMP 
#else
  #define omp_get_thread_num() 0
  #define omp_get_num_threads() 1
#endif
//#define PRINTF_ALL	// comentar para quitar el printf que imprime todos los componentes

#define VECTOR_GLOBAL
#define MAX 33554432	  //=2^25

double v1[MAX], v2[MAX], v3[MAX]; 

 
int main(int argc, char** argv){  
  int i;
  double t_ini, t_fin, t_elapsed; //para tiempo de ejecución

  //Leer argumento de entrada (nº de componentes del vector)
  if (argc<2){	
    printf("Faltan nº componentes del vector\n");
    exit(-1);
  }
  
  unsigned int N = atoi(argv[1]);	// Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

  if (N>MAX) N=MAX;
 
  //Inicializar vectores 
  #pragma omp parallel for
  for(i=0; i<N; i++){ 
    v1[i] = N*0.1+i*0.1; v2[i] = N*0.1-i*0.1; //los valores dependen de N
  }

  t_ini = omp_get_wtime();
 
  #pragma omp parallel for 
  for(i=0; i<N; i++) 
    v3[i] = v1[i] + v2[i];
 
  t_fin = omp_get_wtime();
  t_elapsed = t_fin - t_ini;


  //Imprimir resultado de la suma y el tiempo de ejecución
  #ifdef PRINTF_ALL
  printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",t_elapsed,N); 
  for(i=0; i<N; i++) 
    printf("/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",i,i,i,v1[i],v2[i],v3[i]);
  #else
    printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",t_elapsed,N);
    for (int i=0; i<N ; i++)
      printf("V1[%d]+V2[%d]=V3[%d] \t(%8.6f+%8.6f=%8.6f)\n",i,i,i,v1[i],v2[i],v3[i]);
  #endif

  return 0; 
}
