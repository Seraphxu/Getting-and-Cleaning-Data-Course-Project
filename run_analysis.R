library(dplyr)

# Create a folder
if(!file.exists("./Project")) dir.create("./Project")

# Download and unzip the data.
zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipurl, destfile = "./Project/DataZip.zip")
unzipedFile <- unzip("./Project/DataZip.zip", exdir = "./Project")

# Open the data
X_test <- read.table("./Project/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./Project/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./Project/UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table("./Project/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./Project/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./Project/UCI HAR Dataset/train/subject_train.txt")

# 1.Merges the training and the test sets to create one data set.
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
merged_data <- rbind(train, test)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./Project/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
mean_std_index <- grep("mean[()]|std[()]", features[[2]])
extracted_data <- merged_data[, c(1, 2, mean_std_index+2)] # subject, X with mean and std, y
colnames(extracted_data) <- c("subject", "activity", features[[2]][mean_std_index])

# 3.Uses descriptive activity names to name the activities in the data set
activity_names <- read.table("./Project/UCI HAR Dataset/activity_labels.txt")
extracted_data$activity <- activity_names[[2]][extracted_data$activity]

# 4.Appropriately labels the data set with descriptive variable names.
names(extracted_data) <- gsub("^f", "Frequency", names(extracted_data))
names(extracted_data) <- gsub("^t", "Time", names(extracted_data))
names(extracted_data) <- gsub("mean", "Mean", names(extracted_data))
names(extracted_data) <- gsub("std", "Std", names(extracted_data))
names(extracted_data) <- gsub("[()]", "", names(extracted_data))
names(extracted_data) <- gsub("-", "", names(extracted_data))

# 5.From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
averange <- group_by(extracted_data, subject, activity)
averange <- summarise_each(averange,funs(mean))
write.table(averange, "./Project/Averange.txt", row.names = FALSE)





