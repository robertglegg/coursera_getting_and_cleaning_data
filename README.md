# coursera_getting_and_cleaning_data
A repo for the final project of a Coursera course

This repository contains material related to the final project of the Coursera
course Getting and Cleaning Data. The objective of this project is to read in
some data from the UCI HAR study, process it, and transform it.

To execute the script, one must first put the UCI HAR data folder in one's 
working directory. Then source the file run_analysis.R. This runs the script, 
which first reads in the UCI HAR data, merges test and training data, updates
certain variable names, and then outputs a dataset in the form of 
text file, meansMergedData.txt.

This dataset consists of the arithmetic means of certain measurements from the 
UCI HAR study, calculated by subject and by activity. This dataset is tidy, in
that each row contains an observation, i.e., is one subject and one activity, 
each column contains a variable, i.e., a mean of a certain measurement for
this subject and activity, and this table consists of a single type of data, 
i.e., means of measurements by activity and by subject obtained from the UCI
HAR study.

For information about the variable names of this dataset, see the file 
code_book.md.
