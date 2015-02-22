##### Getting and cleaning data- Course Project #####
setwd("E:/Coursera/Data Science Specialization/3. Getting and cleaning data/Course project")

library(dplyr)

### Step 1. Read in datasets and merge to one 
## Test set
subject_test <- scan("./UCI HAR Dataset/test/subject_test.txt", what="integer", sep="", strip.white = T)
#subject_test <- as.numeric(subject_test)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="", stringsAsFactors= F)
y_test  <- scan("./UCI HAR Dataset/test/y_test.txt", what="integer", sep="\n", strip.white = T)
test <- cbind(subject_test, y_test, X_test)
colnames(test) <- c("subject", "activity", paste("feature",seq(1:561)))

## Training set
subject_train <- scan("./UCI HAR Dataset/train/subject_train.txt", what="integer", sep="", strip.white = T)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="", stringsAsFactors= F)
y_train <- scan("./UCI HAR Dataset/train/y_train.txt", what="integer", sep="\n", strip.white = T)
train <- cbind(subject_train, y_train, X_train)
colnames(train) <- c("subject", "activity", paste("feature",seq(1:561)))

## Merge test and train
Merge <- rbind(test, train)

### Step 2.Extract only the measurements on the mean and standard deviation for each measurement
## Read in features 
feature <- read.table("./UCI HAR Dataset/features.txt", sep="", stringsAsFactors= F)
head(feature)
## Check features that contains mean and std in them
f_select <- grep("-(mean|std)\\(\\)", feature[, 2]) # total 66 variables
## Subset mean and standard deviation from Merge
Selected <- Merge[,f_select]

### Step 3. Rename the activities in descriptive activity names 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="", stringsAsFactors= F)
Merge[,1] <- as.numeric(Merge[,1]); Merge[,2] <- as.numeric(Merge[,2])
Data <- Merge[,c(1,2)]
Data <- mutate(Data, activity = activity_labels[match (activity, activity_labels[,1]), 2]) # replace labels with real activity label

### Step 4. Appropriately labels the data set with descriptive variable names and combine all variables together. 
colnames(Selected) <- feature[f_select,2]
Data <- cbind(Data, Selected)
head(Data)

### Step 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
Final <- ddply(Data, .(subject, activity), function(x) colMeans(x[, 3:68]))
write.table(Final, "Final_output.txt", row.name = F)
