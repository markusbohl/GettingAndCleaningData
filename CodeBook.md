CodeBook
========

Source of Data
--------------

The data used in this analysis comes from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Their feature selection is described as follows:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> * tBodyAcc-XYZ
> * tGravityAcc-XYZ
> * tBodyAccJerk-XYZ
> * tBodyGyro-XYZ
> * tBodyGyroJerk-XYZ
> * tBodyAccMag
> * tGravityAccMag
> * tBodyAccJerkMag
> * tBodyGyroMag
> * tBodyGyroJerkMag
> * fBodyAcc-XYZ
> * fBodyAccJerk-XYZ
> * fBodyGyro-XYZ
> * fBodyAccMag
> * fBodyAccJerkMag
> * fBodyGyroMag
> * fBodyGyroJerkMag

> The set of variables that were estimated from these signals are: 

> * mean(): Mean value
> * std(): Standard deviation
> * *(15 other variables)*

Variables
---------

The created tidy data set contains the following variables:

* `activity`
* `tBodyAcc.mean...X`
* `tBodyAcc.mean...Y`
* `tBodyAcc.mean...Z`
* `tBodyAcc.std...X`
* `tBodyAcc.std...Y`
* `tBodyAcc.std...Z`
* `tGravityAcc.mean...X`
* `tGravityAcc.mean...Y`
* `tGravityAcc.mean...Z`
* `tGravityAcc.std...X`
* `tGravityAcc.std...Y`
* `tGravityAcc.std...Z`
* `tBodyAccJerk.mean...X`
* `tBodyAccJerk.mean...Y`
* `tBodyAccJerk.mean...Z`
* `tBodyAccJerk.std...X`
* `tBodyAccJerk.std...Y`
* `tBodyAccJerk.std...Z`
* `tBodyGyro.mean...X`
* `tBodyGyro.mean...Y`
* `tBodyGyro.mean...Z`
* `tBodyGyro.std...X`
* `tBodyGyro.std...Y`
* `tBodyGyro.std...Z`
* `tBodyGyroJerk.mean...X`
* `tBodyGyroJerk.mean...Y`
* `tBodyGyroJerk.mean...Z`
* `tBodyGyroJerk.std...X`
* `tBodyGyroJerk.std...Y`
* `tBodyGyroJerk.std...Z`
* `tBodyAccMag.mean..`
* `tBodyAccMag.std..`
* `tGravityAccMag.mean..`
* `tGravityAccMag.std..`
* `tBodyAccJerkMag.mean..`
* `tBodyAccJerkMag.std..`
* `tBodyGyroMag.mean..`
* `tBodyGyroMag.std..`
* `tBodyGyroJerkMag.mean..`
* `tBodyGyroJerkMag.std..`
* `fBodyAcc.mean...X`
* `fBodyAcc.mean...Y`
* `fBodyAcc.mean...Z`
* `fBodyAcc.std...X`
* `fBodyAcc.std...Y`
* `fBodyAcc.std...Z`
* `fBodyAccJerk.mean...X`
* `fBodyAccJerk.mean...Y`
* `fBodyAccJerk.mean...Z`
* `fBodyAccJerk.std...X`
* `fBodyAccJerk.std...Y`
* `fBodyAccJerk.std...Z`
* `fBodyGyro.mean...X`
* `fBodyGyro.mean...Y`
* `fBodyGyro.mean...Z`
* `fBodyGyro.std...X`
* `fBodyGyro.std...Y`
* `fBodyGyro.std...Z`
* `fBodyAccMag.mean..`
* `fBodyAccMag.std..`
* `fBodyBodyAccJerkMag.mean..`
* `fBodyBodyAccJerkMag.std..`
* `fBodyBodyGyroMag.mean..`
* `fBodyBodyGyroMag.std..`
* `fBodyBodyGyroJerkMag.mean..`
* `fBodyBodyGyroJerkMag.std..`

From the original data, only mean (`.mean.`) and standard deviation (`.std.`) values have been processed. 

Data
----

The `activity` variable can contain one of the following values and obviously describe the activity conducted while the original acceleration values were measured:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

All other variables show an average value calculated from the original values grouped by activity.

Transformations
---------------

The key transformation (grouping and average calculation) was conducted by

`tidy <- mean_std_activity_data %>% group_by(activity) %>% summarise_each(funs(mean))`

where `mean_std_activity_data` is a data frame containing ungrouped data for each variable.


Tidy data
---------

The `run_analysis.R` script produces a data frame called `tidy`. To get an idea how it looks like, the first three (of 66) average columns per activity are shown below.

|   |      activity      | tBodyAcc.mean...X | tBodyAcc.mean...Y | tBodyAcc.mean...Z | ... |
|---|:------------------:|:-----------------:|:-----------------:|:-----------------:|:---:|
| 1 | LAYING             |         0.2686486 |       -0.01831773 |        -0.1074356 | ... |
| 2 | SITTING            |         0.2730596 |       -0.01268957 |        -0.1055170 | ... |
| 3 | STANDING           |         0.2791535 |       -0.01615189 |        -0.1065869 | ... |
| 4 | WALKING            |         0.2763369 |       -0.01790683 |        -0.1088817 | ... |
| 5 | WALKING_DOWNSTAIRS |         0.2881372 |       -0.01631193 |        -0.1057616 | ... |
| 6 | WALKING_UPSTAIRS   |         0.2622946 |       -0.02592329 |        -0.1205379 | ... |

