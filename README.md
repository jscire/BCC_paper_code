## Repository overview
This repository contains files to reproduce the analyses presented in
the Bayesian Cell Classifier chapter. It contains XMLs with all the analyses specifications
 and a jar file with BEAST2, the BayesianCellClassifier and other useful BEAST packages
 to readily run the analyses specified in the XML files.

 To 'naively' run an analysis, use for example the command
`java -jar BayesianCellClassifier Model_selection/Analysis_Model_selection.xml`
 when using a terminal with the work directory set to the root of this directory.

 Change the XML file location and name to run a different analysis.
 In each analysis directory, we provide RunArrayJobs.sh files, which show the
 full configurations specified to run the inference on the ETH Zurich Euler servers.
 These files can be helpful to show how to specify such a run
 (specifying the number of cores used, the output file location, ...).


### Package source code
The source code of the BayesianCellClassifier package can be found [here](https://github.com/jscire/BayesianCellClassifier).
