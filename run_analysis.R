# Course Project - Getting and Cleaning Data
# Coursera / Johns Hopkins University
# by Jasja de Vries

#######################################################
# Part 1: Merge training and test to create 1 dataset #
#######################################################

setwd("C:\\Coursera\\R Programming\\UCI HAR Dataset")
features <- read.table('features.txt',header=FALSE);
activity_labels <- read.table('activity_labels.txt',header=FALSE)
subject_train <- read.table('./train/subject_train.txt',header=FALSE)
x_train <- read.table('./train/x_train.txt',header=FALSE)
y_train <- read.table('./train/y_train.txt',header=FALSE)

# Setting names for the columns and create train dataset:
colnames(activity_labels) <- c('activityId','activityType')
colnames(subject_train) <- "subjectId"
colnames(x_train) <- features[,2] 
colnames(y_train) <- "activityId"
train <- cbind(y_train,subject_train,x_train)

# Get testdata from the test-folder:
subject_test <- read.table('./test/subject_test.txt',header=FALSE)
x_test <- read.table('./test/x_test.txt',header=FALSE)
y_test <- read.table('./test/y_test.txt',header=FALSE)

# Setting names for the columns and create test dataset:
colnames(subject_test) <- "subjectId"
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
test <- cbind(y_test,subject_test,x_test)

# build the  final measures data set:
measures <- rbind(train,test)
