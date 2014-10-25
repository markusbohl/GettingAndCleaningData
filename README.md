Getting and Cleaning Data
=========================

About
-----

The contents of this repository are the result of a Coursera project in the _Getting and Cleaning Data_ course. The goal is to demonstrate the ability to collect, work with, and clean a data set.

The data used in this analysis is part of the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). All relevant data files from this project have been copied into this repository in order to keep the creation of a clean data set reproducible. Those files are:
* `X_test.txt`
* `X_train.txt`
* `y_test.txt`
* `y_train.txt`
* `activity_labels.txt`
* `features.txt`

More specifically, an R script called `run_analysis.R` has to be created that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

That is, the `run_analysis.R` file contains the script that basically does all the work and finally creates a clean data set. The result was written to the `tidy_data_set.txt` file.

The `CodeBook.md` file gives a more detailed overview of the variables and data used, the transformations conducted and the results created.

How the `run_analysis.R` script works
-------------------------------------

Apart from base R functions the script makes use of the `dplyr` and `data.table` packages.

The following steps were conducted:

1. The activity-ids for training and test data are read and joined with their corresponding descriptive labels. This helps to easily identify the activity (walking, sitting, laying, etc.) associated with each observation of the test and training data.

2. The names of the measured features are read from the `features.txt` file and used as variable-/column-names when reading the test and training data into a data frame.

3. Having the feature names set as column names allows us to use `dplyr`'s `select` function to throw out all the columns that contain neither mean nor standard diviation values.

4. The activity descriptions gathered in the first step can now be added as an additional column to the training and test data sets from the third step.

5. The training and test data sets (now, only containing mean and standard deviation observations with their respective activity description) can be combined in a single data set.

6. Eventually, the tidy data set is created by grouping the data by `activity` and calculating the mean values for each variable and group.

On various occasions throughout the script data frames which are not needed anymore are removed from memory.