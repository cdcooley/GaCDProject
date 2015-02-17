## Tidy Data Subset of the Human Activity Recognition Using Smartphones Dataset

The Human Activity Recognition Using Smartphones Dataset represents data based on experiments carried out with a group of 30 volunteers who performed various activities while measuring their movement using the accelerometer and gyroscope of their smartphones. The raw signals were then processed to create a collection of feature variables. The ReadMe.txt and features_info.txt files from the original data set provide a more complete description of the experiment, signal processing, and published data file formats.

The published data files are not organized for easy import into R, so the run_analysys.R script reads a subset of the original data into tidy data tables. After running the script the R workspace will contain four new data frames: data_long, data_wide, means_long, and means_wide. The data_wide frame contains the subset described in the codebook below. The means_wide frame contains the same variables but with a single mean value for each of the features for each subject and activity. The data_long and means_long frames contain the same data as the correponding wide frame, but with all of the feature variables melted into a single variable. Both wide and long variants are provided since both are useful for different types of data processing and analysis.


### Defining and Building the Tidy Data Subset

The original data set includes 561 calculated features. Only the 66 calculated using the mean() and std() functions (representing paired mean and standard deviation summaries of some quantity) have been selected for the subset. While there are additional features with the word mean in their name they represent entirely different types of calculations.

The feature names provided with the original data set include parentheses and punctuation that do not translate well into R variable names. Excess punctuation has been stripped and the components of the names slightly rearranged (X, Y, and Z moved before mean or std) to produce better names for the R data frames. The erroneous fBodyBody prefix has also been reduced to simply fBody, but otherwise feature names have been imported directly from the orginal data set which allows for easy reference to the original documentation found in features_info.txt.

Activity labels have been substituted for the original numeric encoding scheme.

The train and test groups of the original data set have been merged.


### Code Book

The processed data sets contain 2 categorical variables.

* __subject__ - integer value ranging from 1 to 30 identifying the subjects who performed the activites
* __activity__ - one of six activity names - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

There are also 66 quanitative variables (features) representing mean and standard deviation values that have been normalized and bounded within [-1,1]. Understanding the large list of features is easier if each component of the feature name is considered independently.

* The 't' and 'f' prefixes indicate time domain and frequency domain signals respectively.
* There are both body and gravity acceleration data values.
* "Acc" indicates linear acceleration based on data collected from the accelerometer.
* "Gyro" indicates anglar velocity based on data collected from the gyroscope.
* "Jerk" is the physics term for a higher-order rate of change.
* The "X", "Y", "Z" represent components of the 3-axial signals while "Mag" is the 
magnitude of that signal.

The complete list of 66 features follows.

* __tBodyAccX.mean__ - mean of the X component of the time domain body linear acceleration signal
* __tBodyAccY.mean__ - mean of the Y component of the time domain body linear acceleration signal
* __tBodyAccZ.mean__ - mean of the Z component of the time domain body linear acceleration signal
* __tBodyAccX.std__ - standard deviation of the X component of the time domain body linear acceleration signal
* __tBodyAccY.std__ - standard deviation of the Y component of the time domain body linear acceleration signal
* __tBodyAccZ.std__ - standard deviation of the Z component of the time domain body linear acceleration signal
* __tGravityAccX.mean__ - mean of the X component of the time domain gravity linear acceleration signal
* __tGravityAccY.mean__ - mean of the Y component of the time domain gravity linear acceleration signal
* __tGravityAccZ.mean__ - mean of the Z component of the time domain gravity linear acceleration signal
* __tGravityAccX.std__ - standard deviation of the X component of the time domain gravity linear acceleration signal
* __tGravityAccY.std__ - standard deviation of the Y component of the time domain gravity linear acceleration signal
* __tGravityAccZ.std__ - standard deviation of the Z component of the time domain gravity linear acceleration signal
* __tBodyAccJerkX.mean__ - mean of the X component of the time domain body linear acceleration jerk signal
* __tBodyAccJerkY.mean__ - mean of the Y component of the time domain body linear acceleration jerk signal
* __tBodyAccJerkZ.mean__ - mean of the Z component of the time domain body linear acceleration jerk signal
* __tBodyAccJerkX.std__ - standard deviation of the X component of the time domain body linear acceleration jerk signal
* __tBodyAccJerkY.std__ - standard deviation of the Y component of the time domain body linear acceleration jerk signal
* __tBodyAccJerkZ.std__ - standard deviation of the Z component of the time domain body linear acceleration jerk signal
* __tBodyGyroX.mean__ - mean of the X component of the time domain body angular velocity signal
* __tBodyGyroY.mean__ - mean of the Y component of the time domain body angular velocity signal
* __tBodyGyroZ.mean__ - mean of the Z component of the time domain body angular velocity signal
* __tBodyGyroX.std__ - standard deviation of the X component of the time domain body angular velocity signal
* __tBodyGyroY.std__ - standard deviation of the Y component of the time domain body angular velocity signal
* __tBodyGyroZ.std__ - standard deviation of the Z component of the time domain body angular velocity signal
* __tBodyGyroJerkX.mean__ - mean of the X component of the time domain body angular velocity jerk signal
* __tBodyGyroJerkY.mean__ - mean of the Y component of the time domain body angular velocity jerk signal
* __tBodyGyroJerkZ.mean__ - mean of the Z component of the time domain body angular velocity jerk signal
* __tBodyGyroJerkX.std__ - standard deviation of the X component of the time domain body angular velocity jerk signal
* __tBodyGyroJerkY.std__ - standard deviation of the Y component of the time domain body angular velocity jerk signal
* __tBodyGyroJerkZ.std__ - standard deviation of the Z component of the time domain body angular velocity jerk signal
* __tBodyAccMag.mean__ - mean of the magnitude of the time domain body linear acceleration signal
* __tBodyAccMag.std__ - standard deviation of the magnitude of the time domain body linear acceleration signal
* __tGravityAccMag.mean__ - mean of the magnitude of the time domain gravity linear acceleration signal
* __tGravityAccMag.std__ - standard deviation of the magnitude of the time domain gravity linear acceleration signal
* __tBodyAccJerkMag.mean__ - mean of the magnitude of the time domain body linear acceleration jerk signal
* __tBodyAccJerkMag.std__ - standard deviation of the magnitude of the time domain body linear acceleration jerk signal
* __tBodyGyroMag.mean__ - mean of the magnitude of the time domain body angular velocity signal
* __tBodyGyroMag.std__ - standard deviation of the magnitude of the time domain body angular velocity signal
* __tBodyGyroJerkMag.mean__ - mean of the magnitude of the time domain body angular velocity jerk signal
* __tBodyGyroJerkMag.std__ - standard deviation of the magnitude of the time domain body angular velocity jerk signal
* __fBodyAccX.mean__ - mean of the X component of the frequency domain body linear acceleration signal
* __fBodyAccY.mean__ - mean of the Y component of the frequency domain body linear acceleration signal
* __fBodyAccZ.mean__ - mean of the Z component of the frequency domain body linear acceleration signal
* __fBodyAccX.std__ - standard deviation of the X component of the frequency domain body linear acceleration signal
* __fBodyAccY.std__ - standard deviation of the Y component of the frequency domain body linear acceleration signal
* __fBodyAccZ.std__ - standard deviation of the Z component of the frequency domain body linear acceleration signal
* __fBodyAccJerkX.mean__ - mean of the X component of the frequency domain body linear acceleration signal
* __fBodyAccJerkY.mean__ - mean of the Y component of the frequency domain body linear acceleration signal
* __fBodyAccJerkZ.mean__ - mean of the Z component of the frequency domain body linear acceleration signal
* __fBodyAccJerkX.std__ - standard deviation of the X component of the frequency domain body linear acceleration signal
* __fBodyAccJerkY.std__ - standard deviation of the Y component of the frequency domain body linear acceleration signal
* __fBodyAccJerkZ.std__ - standard deviation of the Z component of the frequency domain body linear acceleration signal
* __fBodyGyroX.mean__ - mean of the X component of the frequency domain body angular velocity signal
* __fBodyGyroY.mean__ - mean of the Y component of the frequency domain body angular velocity signal
* __fBodyGyroZ.mean__ - mean of the Z component of the frequency domain body angular velocity signal
* __fBodyGyroX.std__ - standard deviation of the X component of the frequency domain body angular velocity signal
* __fBodyGyroY.std__ - standard deviation of the Y component of the frequency domain body angular velocity signal
* __fBodyGyroZ.std__ - standard deviation of the Z component of the frequency domain body angular velocity signal
* __fBodyAccMag.mean__ - mean of the magnitude of the frequency domain body linear acceleration signal
* __fBodyAccMag.std__ - standard deviation of the magnitude of the frequency domain body linear acceleration signal
* __fBodyAccJerkMag.mean__ - mean of the magnitude of the frequency domain body linear acceleration jerk signal
* __fBodyAccJerkMag.std__ - standard deviation of the magnitude of the frequency domain body linear acceleration jerk signal
* __fBodyGyroMag.mean__ - mean of the magnitude of the frequency domain body angular velocity signal
* __fBodyGyroMag.std__ - standard deviation of the magnitude of the frequency domain body angular velocity signal
* __fBodyGyroJerkMag.mean__ - mean of the magnitude of the frequency domain body angular velocity jerk signal
* __fBodyGyroJerkMag.std__ - standard deviation of the magnitude of the frequency domain body angular velocity jerk signal

