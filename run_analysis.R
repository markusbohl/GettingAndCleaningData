library(dplyr)
library(data.table)

# read training labels
training_lbls <- read.table("y_train.txt")

# read test labels
test_lbls <- read.table("y_test.txt")

# read activity labels
activity_lbls <- read.table("activity_labels.txt")

# add descriptive activity names to the activity-ids in training and test data set.
training_desc_lbls <- left_join(training_lbls, activity_lbls, by = c("V1"))
test_desc_lbls <- left_join(test_lbls, activity_lbls, by = c("V1"))

# remove data sets from memory which are not needed anymore
rm(activity_lbls)
rm(training_lbls)
rm(test_lbls)

# read the features set
features <- read.table("features.txt")

# read training set, using the feature names as names for the variables
full_training_set <- read.table("X_train.txt", col.names = features$V2)

# read test set, using the feature names as names for the variables
full_test_set <- read.table("X_test.txt", col.names = features$V2)

# only keep the measurements on mean and standard deviation
mean_std_training_set <- select(full_training_set, matches("\\.mean\\.|\\.std\\."))
mean_std_test_set <- select(full_test_set, matches("\\.mean\\.|\\.std\\."))

# remove from memory what is not needed anymore
rm(features)
rm(full_training_set)
rm(full_test_set)

# add activity columns to data sets
mean_std_training_set$activity <- training_desc_lbls[,2]
mean_std_test_set$activity <- test_desc_lbls[,2]

# combine training and test data sets
mean_std_activity_data <- rbind(mean_std_training_set, mean_std_test_set)

# remove what is not needed anymore
rm(mean_std_test_set)
rm(mean_std_training_set)
rm(test_desc_lbls)
rm(training_desc_lbls)

# create a tidy data set with the average of each variable for each activity and
# each subject
tidy <- mean_std_activity_data %>% group_by(activity) %>% summarise_each(funs(mean))

rm(mean_std_activity_data)
