#!/bin/bash

module load java
for counter in $(seq 1 1 10)
  do
    bsub -n 3 -W 24:00 -J Analysis_PickedMPPs_2types_3_gens_linreg_all_batches_${counter} -oo out/Analysis_PickedMPPs_2types_3_gens_linreg_all_batches.out java -jar GeneralClassifier.jar -D job_idx=${counter} -statefile Analysis_PickedMPPs_2types_3_gens_linreg_all_batches_${counter}.state -overwrite Analysis_PickedMPPs_2types_3_gens_linreg_all_batches.xml 2> Analysis_PickedMPPs_2types_3_gens_linreg_all_batches.err
    for i in $(seq 1 1 9)
    do
    	bsub -n 3 -W 24:00 -J Analysis_PickedMPPs_2types_3_gens_linreg_all_batches_${counter} -oo out/Analysis_PickedMPPs_2types_3_gens_linreg_all_batches.out -w "ended(Analysis_PickedMPPs_2types_3_gens_linreg_all_batches_${counter})" java -jar GeneralClassifier.jar -D job_idx=${counter} -statefile Analysis_PickedMPPs_2types_3_gens_linreg_all_batches_${counter}.state -resume -overwrite Analysis_PickedMPPs_2types_3_gens_linreg_all_batches.xml 2> Analysis_PickedMPPs_2types_3_gens_linreg_all_batches.err
    done
  done
