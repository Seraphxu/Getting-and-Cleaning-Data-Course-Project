# Getting-and-Cleaning-Data-Course-Project
The script contains 6 parts.
1. Preprocess.  
a. Create a folder to store the downloaded data.  
b. Unzip the file.  
c. Open the six files named "X_test", "y_test", "subject_test", "X_train", "y_train", "subject_train" and store them to six variables.  

2. Merges the training and the test sets to create one data set.  
Use cbind(), rbind() to merge the data.  

3. Extracts only the measurements on the mean and standard deviation for each measurement.  
Open "features.txt". Search the features with "mean() and "std()". Noting that features like "meanFreq()" should be excluded, we should use "mean[()]|std[()]".  

4. Uses descriptive activity names to name the activities in the data set
Open "activity_labels.txt" file, and name of the activities according to the numbers which are corresponded o the numbers in "activity_labels.txt".  

5. Appropriately labels the data set with descriptive variable names.  
All the "()" and "-" should be deleted.  
Initial of each word should be capital.  
The abbreviations like "f", "t" should be restored to "Frequancy" and "Time".  

6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  


# Code Book
"X_test", "y_test", "subject_test", "X_train", "y_train", "subject_train": The opened files with the same names of the virables   
"train": The merged dataframe of "X_test", "y_test", "subject_test"  
"test": The merged dataframe of "X_train", "y_train", "subject_train"  
"merged_data": The merged dataframe of "train" and "test"  
"mean_std_index": The indices of the measurements only on the mean and standard deviation. 
"extracted_data": The extracted data that only contains the mean and standard deviation for each measurement  
"activity_names": The data in the file "activity_labels.txt"  
