## Getting and Cleaning Data Project

### Description
This codebook contains information about the variables, data and transformations used in the course project for the Getting and Cleaning Data Coures from Coursera/Johns Hopkins University.

### Source Data
A description of the data used in this project can be found at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The data used in this project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Attribute Information
For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Working of the script
The run_analysis.R consists of 5 parts which perform the following actions:

#### Part 1: Merge training and test to create 1 dataset
After setting the working directory to the directory containing the testset the following files are read into datatables:
- features.txt
- activity_labels.txt
- subject_train.txt (from train-subdirectory)
- x_train.txt (from train-subdirectory)
- y_train.txt (from train-subdirectory)
- subject_test (from test-subdirectory)
- x_test.txt (from test-subdirectory)
- y_test (from test-subdirectory)

After assigning names for the columns the data is merged into a single dataset called "measurements".

#### Part 2: Extract mean and standard deviation measurements
The measurement dataset is reduded in this step to contain only columns containing the following string in their names:
- activity
- subject
- mean
- -mean
- -meanFreq
- -std
- -std()
