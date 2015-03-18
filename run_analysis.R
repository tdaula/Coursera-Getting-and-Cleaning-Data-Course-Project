#Week3: Course Project

###Description of data:
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Location of data
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Download and unzip data (one-time)
setwd("C:\\Users\\Tom\\Dropbox\\Computing\\Coursera\\Getting and Cleaning Data\\Week3")
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileURL, destfile="./data/wearableData.zip",mode="wb")

#List zip file contents
file_ls <- as.character(unzip("./data/wearableData.zip", list = TRUE)$Name)

#Extract and merge test data
dataX_test <- read.table(unz("./data/wearableData.zip", "UCI HAR Dataset/test/X_test.txt"))
dataY_test <- read.table(unz("./data/wearableData.zip", "UCI HAR Dataset/test/y_test.txt"))
subj_test <- read.table(unz("./data/wearableData.zip", "UCI HAR Dataset/test/subject_test.txt"))
names(dataY_test) <- "activity"
names(subj_test) <- "subject"

data_test <- data.frame(dataX_test, dataY_test, subj_test, check.names = TRUE)

rm(dataX_test, dataY_test, subj_test) #Remove temporary data

#Extract and merge training data
dataX_train <- read.table(unz("./data/wearableData.zip", "UCI HAR Dataset/train/X_train.txt"))
dataY_train <- read.table(unz("./data/wearableData.zip", "UCI HAR Dataset/train/y_train.txt"))
subj_train <- read.table(unz("./data/wearableData.zip", "UCI HAR Dataset/train/subject_train.txt"))
names(dataY_train) <- "activity"
names(subj_train) <- "subject"

data_train <- data.frame(dataX_train, dataY_train, subj_train, check.names = TRUE)

rm(dataX_train, dataY_train, subj_train) #Remove temporary data

#Append training data to test data.
data <- rbind(data_test, data_train)

rm(data_test, data_train) #Remove temporary data

###Get feature list
features <- read.table(unz("./data/wearableData.zip", "UCI HAR Dataset/features.txt"), as.is = 2)

###Find columns that are mean() or std().  
matchcol <- grep("mean[(]|std[(]", features[,2], perl=TRUE)

###Rename columns to informative names
#http://www.cookbook-r.com/Manipulating_data/Renaming_columns_in_a_data_frame/
names(data)[matchcol] <- features[matchcol,2]

#Extract mean and std dev columns, as well as activity label.
data <- data[,c(matchcol,562:563)]

#Remove "()" in names.  Still need to quote variable names because of "-".
names(data) <- sub("[(][)]", "",names(data), perl=TRUE)

###Relabel activity
#Create factor variable?
data$activity <- factor(data$activity, levels = c(1:6), 
                        labels = c("Walking","Walking_up","Walking_down","Sitting","Standing","Laying"))

###Create subject/activity means
require(reshape2)

#Reshape each row to be identified by Subject/Activity.
data <- melt(data, id=c("subject","activity"))

#Create dataset that has the mean of all the variables according to Subject/Activity.
#(Rename variables to indicate that it is the Subject/Activity mean of the time-mean or time-std?)
#Name data frame to indicate values.
dataMeanBySubjectActivity <- dcast(data, subject + activity ~ variable, mean )


