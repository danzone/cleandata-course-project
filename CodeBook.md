# Codebook

## Raw data set
Raw data are obtained from UCI Machine Learning Repository in a [compressed file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). In this page you
can have several information about data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The [compressed file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) contains also extensive description about data: see `README.txt` file 

## Data processing

1. Merge the subjects, features and labels for both the training and test sets.
2. Extract the mean and standard deviation for each measurement.
3. Replace activity identifiers with descriptive activity names.
4. Modify column names using more representative names.
5. Computes the mean of each variable for each subject and each activity.


## Tidy data set variables
'data.frame': 180 obs. of  68 variables:


| Column Name                             | Column Type | Example values                                   |
|-----------------------------------------|-------------|--------------------------------------------------|
|subject				  |	int	|	1,2,3,4,...,30				   |
|activity				  |	chr	|LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS					   |
|timeBodyAccelerometer-mean()-X		  |	num	|0.2215982, 0.2813734, 0.2755169		   |
|timeBodyAccelerometer-mean()-Y		  |	num	|-0.04051395, -0.01815874, -0.01895568		   |
|timeBodyAccelerometer-mean()-Z		  |	num	|-0.1132036, -0.1072456, -0.1013005		   |
|timeBodyAccelerometer-std()-X		  |	num	|-0.9280565, -0.9740595, -0.9827766		   |
|timeBodyAccelerometer-std()-Y		  |	num	|-0.8368274, -0.9802774, -0.9620575		   |
|timeBodyAccelerometer-std()-Z		  |	num	|-0.8260614, -0.9842333, -0.9636910		   |
|timeGravityAccelerometer-mean()-X	  |	num	|	...					   |
|timeGravityAccelerometer-mean()-Y	  |	num	|	...					   |
|timeGravityAccelerometer-mean()-Z	  |	num	|	...					   |
|timeGravityAccelerometer-std()-X	  |	num	|	...					   |
|timeGravityAccelerometer-std()-Y	  |	num	|	...					   |
|timeGravityAccelerometer-std()-Z	  |	num	|	...					   |
|timeBodyAccelerometerJerk-mean()-X	  |	num	|	...					   |
|timeBodyAccelerometerJerk-mean()-Y	  |	num	|	...					   |
|timeBodyAccelerometerJerk-mean()-Z	  |	num	|	...					   |
|timeBodyAccelerometerJerk-std()-X	  |	num	|	...					   |
|timeBodyAccelerometerJerk-std()-Y	  |	num	|	...					   |
|timeBodyAccelerometerJerk-std()-Z	  |	num	|	...					   |
|timeBodyGyroscope-mean()-X		  |	num	|						   |
|timeBodyGyroscope-mean()-Y		  |	num	|						   |
|timeBodyGyroscope-mean()-Z		  |	num	|						   |
|timeBodyGyroscope-std()-X		  |	num	|						   |
|timeBodyGyroscope-std()-Y		  |	num	|						   |
|timeBodyGyroscope-std()-Z		  |	num	|						   |
|timeBodyGyroscopeJerk-mean()-X		  |	num	|						   |
|timeBodyGyroscopeJerk-mean()-Y		  |	num	|						   |
|timeBodyGyroscopeJerk-mean()-Z		  |	num	|						   |
|timeBodyGyroscopeJerk-std()-X		  |	num	|						   |
|timeBodyGyroscopeJerk-std()-Y		  |	num	|						   |
|timeBodyGyroscopeJerk-std()-Z		  |	num	|						   |
|timeBodyAccelerometerMagnitude-mean()	  |	num	|						   |
|timeBodyAccelerometerMagnitude-std()	  |	num	|						   |
|timeGravityAccelerometerMagnitude-mean() |	num	|						   |
|timeGravityAccelerometerMagnitude-std()  |	num	|						   |
|timeBodyAccelerometerJerkMagnitude-mean()|	num	|						   |
|timeBodyAccelerometerJerkMagnitude-std() |	num	|						   |
|timeBodyGyroscopeMagnitude-mean()	  |	num	|						   |
|timeBodyGyroscopeMagnitude-std()	  |	num	|						   |
|timeBodyGyroscopeJerkMagnitude-mean()	  |	num	|						   |
|timeBodyGyroscopeJerkMagnitude-std()	  |	num	|						   |
|frequencyBodyAccelerometer-mean()-X	  |	num	|						   |
|frequencyBodyAccelerometer-mean()-Y	  |	num	|						   |
|frequencyBodyAccelerometer-mean()-Z	  |	num	|						   |
|frequencyBodyAccelerometer-std()-X	  |	num	|						   |
|frequencyBodyAccelerometer-std()-Y	  |	num	|						   |
|frequencyBodyAccelerometer-std()-Z	  |	num	|						   |
|frequencyBodyAccelerometerJerk-mean()-X  |	num	|						   |
|frequencyBodyAccelerometerJerk-mean()-Y  |	num	|						   |
|frequencyBodyAccelerometerJerk-mean()-Z  |	num	|						   |
|frequencyBodyAccelerometerJerk-std()-X	  |	num	|						   |
|frequencyBodyAccelerometerJerk-std()-Y	  |	num	|						   |
|frequencyBodyAccelerometerJerk-std()-Z	  |	num	|						   |
|frequencyBodyGyroscope-mean()-X	  |	num	|						   |
|frequencyBodyGyroscope-mean()-Y	  |	num	|						   |
|frequencyBodyGyroscope-mean()-Z	  |	num	|						   |
|frequencyBodyGyroscope-std()-X		  |	num	|						   |
|frequencyBodyGyroscope-std()-Y		  |	num	|						   |
|frequencyBodyGyroscope-std()-Z		  |	num	|	...					   |
|frequencyBodyAccelerometerMagnitude-mean()|	num	|	...					   |
|frequencyBodyAccelerometerMagnitude-std()|	num	|	...					   |
|frequencyBodyAccelerometerJerkMagnitude-mean()|num		|						   |
|frequencyBodyAccelerometerJerkMagnitude-std() |num		|						   |
|frequencyBodyGyroscopeMagnitude-mean()        |num		|						   |
|frequencyBodyGyroscopeMagnitude-std()	       |num		|						   |
|frequencyBodyGyroscopeJerkMagnitude-mean()    |num		|-0.9423669, -0.9902487, -0.9842783		   |
|frequencyBodyGyroscopeJerkMagnitude-std()     |num		|-0.9326607, -0.9894927, -0.9825682		   |
