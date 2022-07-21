#!/bin/bash

module load java
for counter in $(seq 1 1 10)
  do
    bsub -n 3 -W 24:00 -J Analysis_Model_selection_${counter} -oo out/Analysis_Model_selection.out java -jar ../BayesianCellClassifier.jar -D job_idx=${counter} -statefile Analysis_Model_selection_${counter}.state -overwrite Analysis_Model_selection.xml 2> Analysis_Model_selection.err
    for i in $(seq 1 1 10)
    do
    	bsub -n 3 -W 24:00 -J Analysis_Model_selection_${counter} -oo out/Analysis_Model_selection.out -w "ended(Analysis_Model_selection_${counter})" java -jar ../BayesianCellClassifier.jar -D job_idx=${counter} -statefile Analysis_Model_selection_${counter}.state -resume -overwrite Analysis_Model_selection.xml 2> Analysis_Model_selection.err
    done
  done
