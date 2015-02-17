# GaCDProject

This repository contains a completed course project for "Getting and Cleaning Data".

The [run_analysis.R](run_analysis.R) script contains the required code to generate
tidy data subsets of the "Human Activity Recognition Using Smartphones Dataset". It
also contains detailed comments explaining the process. (Note that the process does
not follow the same order as the requirements listed in the assignment instructions.)

[CodeBook.md](CodeBook.md) contains an overview of the data, the transformations
applied as part of this project, and a description of the variables in the resulting
tidy data sets.


### Script Requirements

The 'reshape2' package (available from CRAN) must be installed.

The 'UCI HAR Dataset.zip' file must be in the current working directory or 
it must have already been unzipped (and then possibily removed) into a
'UCI HAR Dataset' subdirectory.


### Script Results

Four data frames will be created in the R workspace environment.

__data_wide__ is the primary data subset described in the CodeBook and the result of step 4 of the assignment instructions.

__data_long__ is a long variant of data_wide with the 66 feature variables melted into a pair of columns named variable and value.

__means_wide__ is the result of step 5 of the assignment instructions.

__means_long__ is a long variant of means_wide.
