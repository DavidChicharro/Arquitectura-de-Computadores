#!/bin/bash
#Uso: ./pmm-OpenMP-pclocal.sh
#Se asigna al trabajo el nombre res_ej10_pclocal
#PBS -N res_ej10_pclocal
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id$PBS_O_WORKDIR usuario del trabajo: $PBS_O_LOGNAME"
echo "Id$PBS_O_WORKDIR del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"

export OMP_DYNAMIC=FALSE
export OMP_NUM_THREADS=1
echo "Ejecucion: static"

for (( i = 100; i <= 1500; i +=200 )); do
	$PBS_O_WORKDIR/pmm-OpenMP $i
done

echo -e "\n"
export OMP_DYNAMIC=TRUE
declare -a threads=(2 6 12)

for i in "${threads[@]}"
do
	export OMP_NUM_THREADS=$i
	echo -e "\n Ejecucion: dynamic - Num. threads = $i"
	for (( j = 100; j <= 1500; j+=200 )); do
		$PBS_O_WORKDIR/pmm-OpenMP $j
	done
done


