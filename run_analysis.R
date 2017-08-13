#Downloading and Loading data
fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./Dataset.zip")
unzip("./Dataset.zip")
install.packages("data.table")
library(data.table)

#Load activity labels and features
activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt')
features <- read.table('./UCI HAR Dataset/features.txt')
featureNames <- as.character(features[,2])

#Extract data on mean and standard deviation
mean_stddev<- grep("-(mean|std)\\(\\)",featureNames)
mean_stddev.names<- grep("-(mean|std)\\(\\)",featureNames,value=TRUE)

#Load train datasets 
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")[mean_stddev]
train_y <- read.table("./UCI HAR Dataset/train/Y_train.txt")
train <- cbind(train_x,train_y,subject_train)

#Load test datasets
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")[mean_stddev]
test_y <- read.table("./UCI HAR Dataset/test/Y_test.txt")
test <- cbind(test_x,test_y,subject_test)

#merge train and test datasets
all_data<- rbind(train,test)

#Add appropriate labels to the dataset
colnames(all_data)<-c(mean_stddev.names,"activity","subject")
colnames(all_data)

#Using descriptive activity names to name the activities in the data set
all_data[,"activity"] <- activity_labels[all_data[, "activity"], 2]
View(all_data)

#Cleaning labels of feature variables
colnames(all_data)<-gsub("std()", "SD", colnames(all_data))
colnames(all_data)<-gsub("mean()", "MEAN", colnames(all_data))
colnames(all_data)<-gsub("^t", "time", colnames(all_data))
colnames(all_data)<-gsub("^f", "frequency", colnames(all_data))
colnames(all_data)<-gsub("Acc", "Accelerometer", colnames(all_data))
colnames(all_data)<-gsub("Gyro", "Gyroscope", colnames(all_data))
colnames(all_data)<-gsub("Mag", "Magnitude", colnames(all_data))
colnames(all_data)<-gsub("BodyBody", "Body", colnames(all_data))
tidy_data <- all_data

#Average of each variable for each activity and subject
tidy_melt <- melt(tidy_data, id=c("subject","activity"))
averages <- dcast(tidy_melt, subject+activity ~ variable, mean)
write.table(averages, "./averages.txt",row.name = FALSE)
