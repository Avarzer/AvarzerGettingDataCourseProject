setwd("C:/Users/X/Documents/Avarzer/CourseProject/UCI HAR Dataset")
features <- as.character(read.table("features.txt", quote="\"")[,2])
X_test <- read.table("test/X_test.txt", quote="\"")
X_train <- read.table("train/X_train.txt", quote="\"")

subject_test <- read.table("test/subject_test.txt", quote="\"")
subject_train <- read.table("train/subject_train.txt", quote="\"")
SubjectID <- rbind(subject_test, subject_train)

y_test <- read.table("test/y_test.txt", quote="\"")
y_train <- read.table("train/y_train.txt", quote="\"")
ActivityID <- rbind(y_test, y_train)
ActivityLabels <- rep(NA, dim(ActivityID)[1])
ActivityLabels[ActivityID == 1] <- "WALKING"
ActivityLabels[ActivityID == 2] <- "WALKING_UPSTAIRS"
ActivityLabels[ActivityID == 3] <- "WALKING_DOWNSTAIRS"
ActivityLabels[ActivityID == 4] <- "SITTING"
ActivityLabels[ActivityID == 5] <- "STANDING"
ActivityLabels[ActivityID == 6] <- "LAYING"

names(X_test) <- features
names(X_train) <- features
mydata <- rbind(X_test, X_train)

mean.or.std <- matrix( NA, 1, length(features))
for( i in 1:length(features)){
  last5chars <- substr( features[i], nchar(features[i]) - 5, nchar(features[i]))
  last7chars <- substr( features[i], nchar(features[i]) - 7, nchar(features[i])-1)
  mean.or.std[i] <- ( last5chars == "mean()" | last5chars == "-std()" | last7chars == "mean()-" | last7chars == "-std()-")
}

mydata.subset <- mydata[,mean.or.std]

MyData <- cbind(SubjectID, ActivityID, ActivityLabels, mydata.subset)
names(MyData)[1] <- "SubjectID"
names(MyData)[2] <- 'ActivityID'

MyTidyData <- aggregate( MyData[,4] ~ SubjectID + ActivityLabels, MyData, mean)
for( var in 5:69){
  MyTidyData <- cbind(MyTidyData, aggregate( MyData[,var] ~ SubjectID + ActivityLabels, MyData, mean)[,3])
}
names(MyTidyData)[3:68] <- paste( "MEAN:", names(MyData[4:69]), sep = "")

write.table(MyTidyData, file = "AvarzerTidyData.txt", row.names = FALSE )
