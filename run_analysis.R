library(dplyr)

## read the data
subject_test <- read.csv("UCI HAR Dataset\\test\\subject_test.txt", header=FALSE)
X_test <- read.csv("UCI HAR Dataset\\test\\X_test.txt", sep="", header=FALSE)
y_test <- read.csv("UCI HAR Dataset\\test\\y_test.txt", header=FALSE)
subject_train <- read.csv("UCI HAR Dataset\\train\\subject_train.txt", header=FALSE)
X_train <- read.csv("UCI HAR Dataset\\train\\X_train.txt", sep="", header=FALSE)
y_train <- read.csv("UCI HAR Dataset\\train\\y_train.txt", header=FALSE)
activity_labels <- read.csv("UCI HAR Dataset\\activity_labels.txt", sep="", header=FALSE)
features <- read.csv("UCI HAR Dataset\\features.txt", sep="", header=FALSE)

## add meaningful labels to the data
names(X_test) <- features[,2]
names(X_train) <- features[,2]
names(subject_test) <- "subject_id"
names(subject_train) <- "subject_id"
names(y_test) <- "activity"
names(y_train) <- "activity"

## treat activity column as a factor variable, and replace them with the activity names
y_test[,1] <- factor(y_test[,1])
y_train[,1] <- factor(y_train[,1])
levels(y_test[,1]) <- activity_labels[,2]
levels(y_train[,1]) <- activity_labels[,2]

## merge data
test_merged <- cbind(subject_test, X_test, y_test)
train_merged <- cbind(subject_train, X_train, y_train)
merged_data <- rbind(test_merged, train_merged)

## extract only the mean and std measurements
mean_index <- grep("mean",names(merged_data))
std_index <- grep("std",names(merged_data))
mean_std_data <- subset(merged_data, select=c(1,mean_index,std_index,activity))

## take the mean of each variable for each subject and activity
final_data <- mean_std_data %>% group_by(subject_id, activity) %>% summarise_each(funs(mean))

## write the new tidy data set to a file for uploading
write.csv(final_data, file="final_data.txt")