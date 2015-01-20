# Course Project - Getting and Cleaning Data
# Coursera / Johns Hopkins University
# by Jasja de Vries

#######################################################
# Part 1: Merge training and test to create 1 dataset #
#######################################################

setwd("C:\\Coursera\\R Programming\\UCI HAR Dataset")
features <- read.table('features.txt',header=FALSE)
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

# build the  final measurements data set:
measurements <- rbind(train,test)

###########################################################
# Part 2: Extract mean and standard deviation measurements#
###########################################################

columns  <- colnames(measurements)
selected_columns <- (grepl("activity..",columns) | grepl("subject..",columns) | grepl("-mean..",columns) & !grepl("-meanFreq..",columns) & !grepl("mean..-",columns) | grepl("-std..",columns) & !grepl("-std()..-",columns))
measurements <- measurements[selected_columns==TRUE]

##############################################
# Part 3: Name the activities in the dataset #
##############################################
measurements = merge(measurements,activity_labels,by='activityId',all.x=TRUE)
columns  <- colnames(measurements)

##############################################################
# Part 4: label the data set with descriptive activity names # 
##############################################################
for (i in 1:length(columns)) 
{
        columns[i] = gsub("\\()","",columns[i])
        columns[i] = gsub("-std$","standard_deviation",columns[i])
        columns[i] = gsub("-mean","mean",columns[i])
        columns[i] = gsub("^(t)","time",columns[i])
        columns[i] = gsub("^(f)","frequency",columns[i])
        columns[i] = gsub("([Gg]ravity)","gravity",columns[i])
        columns[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","body",columns[i])
        columns[i] = gsub("[Gg]yro","gyro",columns[i])
        columns[i] = gsub("AccMag","accelerate_magnitude",columns[i])
        columns[i] = gsub("([Bb]odyaccjerkmag)","body_acc_jer_magnitude",columns[i])
        columns[i] = gsub("JerkMag","jerk_magnitude",columns[i])
        columns[i] = gsub("GyroMag","gyro_magnitude",columns[i])
}
colnames(measurements) <- columns

##################################################################
# Part 5: datast with average of each variable for each activity # 
##################################################################
measurements_no_id <- measurements[,names(measurements) != 'activityType'];

