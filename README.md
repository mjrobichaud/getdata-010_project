# Course project for Coursera's getdata-010.

## Original Instructions
1. You should create one R script called run_analysis.R that does the following.2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## To run the script
1. Download the source data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the archive
3. In R, setwd() to the unzipped directory
4. Put the script "run_analysis.R" in the working directory
5. Run the script via source("run_analysis.R")
6. The output is a tidy dataset in a file "tidy_data.txt"

## Requirements
1. reshape2 package
2. source data
3. run_analysis.R script

