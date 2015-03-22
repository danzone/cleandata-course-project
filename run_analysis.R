## If necessary create data directory
if (!file.exists("./data")){dir.create("./data")}

## If necessary download compressed dataset
if (!file.exists("./data/ucihar_dataset.zip")) {
	message("Downloading dataset...")
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileUrl,destfile="./data/ucihar_dataset.zip",method="curl")
	message("Downloading dataset...Done")
}

## If necessary uncompress compressed dataset
if (!file.exists("./data/UCI HAR Dataset")) {
	message("Uncompress dataset...")
	unzip(zipfile="./data/ucihar_dataset.zip",exdir="./data/")
	message("Uncompress dataset...Done")
}

## Store main directory for datasets
ucihar_dataset_path <- file.path("./data", "UCI HAR Dataset")

## Read datasets
message("Reading activity data...")
trainActivityData <- read.table(file.path(ucihar_dataset_path,"train","y_train.txt"),header = FALSE)
testActivityData <- read.table(file.path(ucihar_dataset_path,"test","y_test.txt"),header = FALSE)
message("Reading activity data...Done")
message("Reading subject data...")
trainSubjectData <- read.table(file.path(ucihar_dataset_path,"train","subject_train.txt"),header = FALSE)
testSubjectData <- read.table(file.path(ucihar_dataset_path,"test","subject_test.txt"),header = FALSE)
message("Reading subject data...Done")
message("Reading feature data...")
trainFeatureData <- read.table(file.path(ucihar_dataset_path,"train","X_train.txt"),header = FALSE)
testFeatureData <- read.table(file.path(ucihar_dataset_path,"test","X_test.txt"),header = FALSE)
message("Reading feature data...Done")

## Merge datasets:
## 1. merge activity data (train and test)
message("Merging activity data (train and test)...")
activityData <- rbind(trainActivityData,testActivityData)
message("Merging activity data (train and test)...Done")
## 2. merge subject data (train and test)
message("Merging subject data (train and test)...")
subjectData <- rbind(trainSubjectData, testSubjectData)
message("Merging subject data (train and test)...Done")
## 3. merge features data (train and test)
message("Merging feature data (train and test)...")
featuresData <- rbind(trainFeatureData, testFeatureData)
message("Merging feature data (train and test)...Done")

message("Setting headers...")
names(activityData) <- c("activity")
names(subjectData) <- c("subject")
featureDataNames <- read.table(file.path(ucihar_dataset_path,"features.txt"),head=FALSE)
names(featuresData) <- featureDataNames$V2
message("Setting headers...Done")
message("Generating dataset...")
dataset <- cbind(subjectData,activityData)
dataset <- cbind(dataset,featuresData)
message("Generating dataset...Done")

## Extract measurements of mean and standard deviation 
message("Extracting measurements of mean and standard deviation...")
subsetFeatureNames <- featureDataNames$V2[grep("mean\\(\\)|std\\(\\)",featureDataNames$V2)]
subsetNames <- c("subject","activity",as.character(subsetFeatureNames))
tidySubset <- subset(dataset,select=subsetNames)
message("Extracting measurements of mean and standard deviation...Done")


## Set descriptive names for activities
message("Setting descriptive names for activities...")
activityLabels <- read.table(file.path(ucihar_dataset_path,"activity_labels.txt"),header=FALSE)

tidySubset <- merge(activityLabels,tidySubset,by.x="V1",by.y="activity")

## Remove raw activities
tidySubset <- tidySubset[,!(names(tidySubset) %in% c("V1"))]
names(tidySubset)[names(tidySubset) == "V2"] <- "activity"

## Set subject in first column
tmpNames <- names(tidySubset)[!(names(tidySubset) %in% c("subject"))]
tidySubset <- tidySubset[,c("subject",as.character(tmpNames))]

message("Setting descriptive names for activities...Done")

## Set descriptive names for variables
message("Setting descriptive names for variables...")
names(tidySubset) <- gsub("^t","time",names(tidySubset))
names(tidySubset) <- gsub("^f","frequency",names(tidySubset))
names(tidySubset) <- gsub("Acc","Accelerometer",names(tidySubset))
names(tidySubset) <- gsub("Gyro","Gyroscope",names(tidySubset))
names(tidySubset) <- gsub("Mag","Magnitude",names(tidySubset))
names(tidySubset) <- gsub("BodyBody","Body",names(tidySubset))
message("Setting descriptive names for variables...Done")


message("Creating second independent dataset and storing it in tidydata.txt file...")
## Create a second independent dataset with the mean of each variable
## aggregated by subject and activity
library(plyr)


tidySubset2 <- aggregate(. ~subject + activity,tidySubset,mean)

write.table(tidySubset2, file = "./data/tidydata.txt",row.names=FALSE)
message("Creating second independent dataset and storing it in tidydata.txt file...Done")

