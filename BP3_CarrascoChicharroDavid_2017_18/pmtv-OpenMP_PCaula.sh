#!/bin/bash
#Se asigna al trabajo el nombre resultado_ej7
#PBS -N resultado_ej7
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id$PBS_O_WORKDIR usuario del trabajo: $PBS_O_LOGNAME"
echo "Id$PBS_O_WORKDIR del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:"
cat $PBS_NODEFILE

export OMP_NUM_THREADS=12

declare -a planificacion=("static" "dynamic" "guided")

for i in "${planificacion[@]}"
do
	for (( j = 0; j < 3; ++j )); do
		if [ $j -eq 0 ]
		then
			echo "$i y chunk por defecto"
			export OMP_SCHEDULE=$i
		elif [ $j -eq 1 ]
		then
			echo "$i y chunk 1"
			export OMP_SCHEDULE="$i,1"
		else
			echo "$i y chunk 64"
			export OMP_SCHEDULE="$i,64"
		fi
		$PBS_O_WORKDIR/pmtv-OpenMP 15360
		echo -e "\n"
	done
done
