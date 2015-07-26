#Step1

# read the testing data set
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="", header = FALSE)
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="", header = FALSE)
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="", header = FALSE)


# Repeat the above steps for Test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="", header = FALSE)
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="", header = FALSE)
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="", header = FALSE)


# Combine the training and testing data
X_All <- rbind(X_train,X_test)
Y_All <- rbind(Y_train, Y_test)
Subject_All <- rbind(Subject_train, Subject_test)

# Step 2
# Read the list of features

Features <- read.table("./UCI HAR Dataset/features.txt", sep="", header = FALSE, stringsAsFactors = FALSE)
# we search in Features data frame for the words "std" and "mean" and subset only those from X_All
Step2_Data <- X_All[,grep("std|mean", Features$V2)]

# Step4 - I am doing step 4 before step3 as I find it easier to name the variables earlier
# assign names to the variables
colnames(Step2_Data) <- Features$V2[grep("std|mean", Features$V2)]
colnames(Y_All) <- "Activity"
colnames(Subject_All) <- "Subject"


Step4_Data <- cbind(Step2_Data, Y_All, Subject_All)

# step 3 - Uses descriptive activity names to name the activities in the data set
Activity_Lables <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="",header = FALSE)
Merged_Step3_Data <- merge(Step4_Data, Activity_Lables,by.x = "Activity", by.y = "V1")
colnames(Merged_Step3_Data)[82] <-"Activity_labels"
#removing the unwanted numbered column
Merged_Step3_Data$Activity <- NULL

# step5 - we will summarize using the dplyr library

library(dplyr)
Step5_Data <- tbl_df(Merged_Step3_Data)

#group data by subject and activity label
Step5_Data_grouped <- group_by(Step5_Data, Subject, Activity_labels)

# summarize by the group for each variable
Step5_Final_Data <- summarise_each(Step5_Data_grouped, funs(mean))



write.table(Step5_Final_Data, file = "output.txt", row.names = FALSE)
