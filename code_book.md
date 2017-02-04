Codebook for Coursera Getting and Cleaning Data Final Project

The script contained in the file run_analysis.R reads in, processes, and 
transforms the data found in the UCI HAR dataset.

The UCI HAR dataset contains measurements obtained from wearable devices on
subjects performing certain activities. The dataset output by the script 
run_analysis.R, stored in the file meansMergedData.txt, is a dataset of the
arithmetic means of a certain subset of the measurements from the UCI HAR
dataset calculated by activity and by subject.

The variable "subjectId" gives the ID, a number from 1 to 30, of the subject 
from whom the data is collected.

The variable "activity" gives the activity a subject is performing: it takes
values "STANDING", "SITTING", "LAYING", "WALKING", "WALKING_DOWNSTAIRS", and
"WALKING_UPSTAIRS".

The remaining variables (those beginning "mean_") give the average of a
particular measurement for the given subject performing the given activity.
These measurements are taken from the UCI HAR dataset and include all 
measurements from that dataset that are themselves means and standard 
deviations. The following variable names are certain normalized measurements: 

tBodyAcc
tGravityAcc
tBodyAccJerk
tBodyGyro
tBodyGyroJerk
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc
fBodyAccJerk
fBodyGyro
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

If a variable name is followed by "_mean", it is a mean of a measurement over a 
certain interval; if followed by "_std", it is a standard deviation. If either
"_mean" or "_std" is followed by _X, _Y, or _Z, this signifies that the 
measurement is taken along the X, Y, or Z axis, respectively.

All variables are prepended with "mean_" to indicate that they themselves are 
means of these measurements, by subject and by activity.

