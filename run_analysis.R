# Clear working directory
rm(list = ls())

# Load required packages
library(data.table)


# Download and unzip the data ---------------------------------------------

dataURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(url = dataURL, destfile = 'tempfile', method = 'curl')
utils::unzip('tempfile')

# Read in the data --------------------------------------------------------

# Training set
trainingSet <- read.table(file = 'UCI HAR Dataset/train/X_train.txt')
trainingLabels <- read.table(file = 'UCI HAR Dataset/train/y_train.txt')
trainingSubjectId <- read.table(file = 'UCI HAR Dataset/train/subject_train.txt')

# Test set
testSet <- read.table(file = 'UCI HAR Dataset/test/X_test.txt')
testLabels <- read.table(file = 'UCI HAR Dataset/test/y_test.txt')
testSubjectId <- read.table(file = 'UCI HAR Dataset/test/subject_test.txt')

# Feature names
featureNames <- read.table(file = 'UCI HAR Dataset/features.txt', row.names = 1)


# Assign column names (Question 4) ----------------------------------------

# To the training and test sets
names(trainingSet) <- featureNames$V2 
names(testSet) <- featureNames$V2

# To the data frame of subject ids:
names(trainingSubjectId) <- 'subjectId'
names(testSubjectId) <- 'subjectId'

# To the data frame of activity labels:
names(trainingLabels) <- 'activity'
names(testLabels) <- 'activity'


# Merge data --------------------------------------------------------------

# Add subjectId column to training and test sets:
trainingSet <- cbind(trainingSet, trainingSubjectId)
testSet <- cbind(testSet, testSubjectId)

# Add activity column to training and test sets:
trainingSet <- cbind(trainingSet, trainingLabels)
testSet <- cbind(testSet, testLabels)

# Merge training and test sets into one data frame (Question 1)
mergedData <- rbind(trainingSet, testSet)


# Extract mean and standard deviation columns -----------------------------

# Keep only measurements that are means and standard deviations. Such features
# have "mean()" and "std()" in their names (Question 2).
meanCols <- grep(x = names(mergedData), pattern = "mean\\(\\)", value = TRUE)
stdCols <- grep(x = names(mergedData), pattern = "std\\(\\)", value = TRUE)

# Keep these measurements along with columns giving the subject ID and the activity
desiredCols <- c(meanCols, stdCols, "subjectId", "activity")
mergedData <- mergedData[, desiredCols]


# Create activity descriptions --------------------------------------------

activityLabels <- c('WALKING', 'WALKING_UPSTAIRS'
                    , 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')

# Replace the activity labels 1-6 with descriptions of the activities they
# correspond to (Question 3).
mergedData$activity <- factor(mergedData$activity
                              , levels = 1:6, labels = activityLabels)


# Compute mean measurement by activity and by subject ---------------------

# This calculation is very easy with the data.table package:
mergedData <- as.data.table(mergedData)

# Create new, tidy data table of means of measurements by activity 
# and subject (Question 5).
meansMergedData <- mergedData[, lapply(.SD, mean)
                              , by = c('subjectId', 'activity')]

# Update the names of this new data table to reflect that they represent means
# of measurements by activity and subject.
names(meansMergedData)[c(-1, -2)] <- paste('mean'
                                           , names(meansMergedData)[c(-1, -2)]
                                           , sep = '_')

# Replace hyphens by underscores in variable names, and eliminate parentheses 
# in variable names (my text editor doesn't deal properly with these 
# characters).
names(meansMergedData) <- gsub(x = names(meansMergedData)
                               , pattern = '-', replacement = '_')
names(meansMergedData) <- gsub(x = names(meansMergedData)
                               , pattern = '\\(\\)', replacement = '')

# Write data table out as a text file.
write.table(meansMergedData
            , file = 'meansMergedData.txt', row.names = FALSE)
