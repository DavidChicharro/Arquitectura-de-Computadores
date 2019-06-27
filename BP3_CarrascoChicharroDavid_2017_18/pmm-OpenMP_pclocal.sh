#!/bin/bash
#Uso: ./pmm-OpenMP-pclocal.sh <ejecutable>

export OMP_DYNAMIC=FALSE
export OMP_NUM_THREADS=1
echo "Ejecucion: static"

for (( i = 100; i <= 1500; i +=200 )); do
	./$1 $i
done

echo -e "\n"
export OMP_DYNAMIC=TRUE

for (( i = 2 ; i <= 4 ; i+=2 )); do
	export OMP_NUM_THREADS=$i
	echo -e "\n Ejecucion: dynamic - Num. threads = $i"
	for (( j = 100; j <= 1500; j+=200 )); do
		./$1 $j
	done
done


