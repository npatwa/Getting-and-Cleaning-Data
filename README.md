# Getting-and-Cleaning-Data Course Project Readme 
This readme explains the data used, R script and the output format for the course project of Getting and Cleaning Data course project

## Data Used
The data used for the script comes from the following files

* X_train.txt
* y_train.txt
* subject_train.txt
* X_test.txt
* y_test.txt
* subject_test.txt

These files are located in the train and test folders respectively of the data set provided

## R script
The various steps to be performed in the analysis are as follows
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

These steps are included in the run_analysis.R file

## Output file
The output of the run_analysis.R is output.txt file and the descriptions of its variables is in the CodeBook.md
