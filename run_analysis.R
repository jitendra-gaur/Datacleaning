#Reading test and training data sets and combine the two datasets by using rbind and assigning after combining the data to variable Data1.
testData <- read.table("test/X_test.txt")
trainData <- read.table("train/X_train.txt")
Data1 <- rbind(testData, trainData)

#Reading test subject and training subject data sets and combine the two datasets by using rbind and assigning after combining the data to variable Subject1.
testSub <- read.table("test/subject_test.txt")
trainSub <- read.table("train/subject_train.txt")
Subject1 <- rbind(testSub, trainSub)

#Reading test subject and training subject data sets and combine the two datasets by using rbind and assigning after combining the data to variable Label1.
testLabel <- read.table("test/y_test.txt")
trainLabel <- read.table("train/y_train.txt")
Label1 <- rbind(testLabel, trainLabel)

#Removing all the unused dataset as they are not used any more.
rm(testData)
rm(trainData)
rm(testSub)
rm(trainSub)
rm(testLabel)
rm(trainLabel)

#Reading Features List. We will use it as column names for data
featuresList <- read.table("features.txt", stringsAsFactors=FALSE)

#Use only names from features list
features <- featuresList$V2

#Logical Vector to keep only std and mean columns
keepColumns <- grepl("(std|mean[^F])", features, perl=TRUE)

#Keep only data we want, and name it human readable
Data1 <- Data1[, keepColumns]
names(Data1) <- features[keepColumns]
names(Data1) <- gsub("\\(|\\)", "", names(Data1))
names(Data1) <- tolower(names(Data1))

#Read ActivityList (to add descriptive names to data set)
activities <- read.table("activity_labels.txt")
activities[,2] = gsub("_", "", tolower(as.character(activities[,2])))
Label1[,1] = activities[Label1[,1], 2]
names(Label1) <- "activity" ## Add activity label

#Create first tidy data set
names(Subject1) <- "subject"
tidyData <- cbind(Subject1, Label1, Data1)
write.table(tidyData, "tidyData.txt")

#Create second tidy data set with avg of each var for each act and each sub
uni_sub = unique(Subject1)[,1]
len_sub = length(uni_sub)
len_act = length(activities[,1])
len_name = length(names(tidyData))
td = tidyData[ 1:(len_sub*len_act), ]
row = 1
for (s in 1:len_sub) {
    for (a in 1:len_act) {
        td[row,1] = uni_sub[s]
        td[row,2] = activities[a, 2]
        tmp <- tidyData[tidyData$subject==s & tidyData$activity==activities[a,2],]
        td[row, 3:len_name] <- colMeans(tmp[, 3:len_name])
        row = row + 1
    }
}
write.table(td, "tidyData2.txt")

