## Getting and Cleaning Data Project

Course project for Getting and cleaning data on Coursera / Johns Hopkins University

### Overview
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis
[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Modifying the script
The script itself should work withou any modifications as long as the working directory, set on line 9 of the script, is used to hold the unpacked source data. Alternatively you can change the working directory by modifying line 9 to point to a path of your choice.

### Project Summary
The script called run_analysis.R does the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.MD file.
