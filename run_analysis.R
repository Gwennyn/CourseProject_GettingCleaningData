library(dplyr)

#Read the source files:

test_X = read.table("\\UCI HAR Dataset\\test\\X_test.txt")
test_Y = read.table("\\UCI HAR Dataset\\test\\Y_test.txt")
subject_test = read.table("\\UCI HAR Dataset\\test\\subject_test.txt")
subject_train = read.table("\\UCI HAR Dataset\\train\\subject_train.txt")
train_X = read.table("\\UCI HAR Dataset\\train\\X_train.txt")
train_Y = read.table("\\UCI HAR Dataset\\train\\Y_train.txt")
features = read.table("\\UCI HAR Dataset\\features.txt")

#Get descriptive column names
colnames(test_X) <- make.names(features[,2], unique = TRUE)
colnames(train_X) <- make.names(features[,2], unique = TRUE)

#Save only the columns about means and standard deviations
test_means <- select(test_X, contains("mean"))
test_stds <- select(test_X, contains("std"))
train_means <- select(train_X, contains("mean"))
train_stds <- select(train_X, contains("std"))

#Combine the means and standard deviations to one set again
test_X <- cbind(test_means, test_stds)
train_X <- cbind(train_means, train_stds)

#Set a descriptive column name for the activities and subjects
colnames(test_Y) <- "activity"
colnames(train_Y) <- "activity"
colnames(subject_test) <- "subject"
colnames(subject_train) <- "subject"

#Combine the data with the activities and subjects
train <- cbind(subject_train, train_Y, train_X)
test <- cbind(subject_test, test_Y, test_X)

#Make one dataset out of test and train
total <- rbind(test, train)

#Set descriptive activity labels
total["activity"][total["activity"] == "1"] <- "WALKING"
total["activity"][total["activity"] == "2"] <- "WALKING_UPSTAIRS"
total["activity"][total["activity"] == "3"] <- "WALKING_DOWNSTAIRS"
total["activity"][total["activity"] == "4"] <- "SITTING"
total["activity"][total["activity"] == "5"] <- "STANDING"
total["activity"][total["activity"] == "6"] <- "LAYING"

#Now group by subject and activity and then get the means of the variables:
grouped <- group_by(total, subject, activity)
summarized <- summarise_each(grouped, funs(mean))

#Write the tidy dataset to a txt file:
write.table(summarized, file = "D:\\Tidy_dataset_activities.txt", row.names=FALSE)
