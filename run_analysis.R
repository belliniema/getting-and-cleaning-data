
library("reshape2")

basepath<-"/Users/user/Documents/DataScience/Coursera/jonhopkins/DataCleaning/swrl/UCIHARDataset/"
activity_labels <- read.table(paste(basepath,"/activity_labels.txt",sep="")  )[,2]
features <- read.table(paste(basepath,"features.txt", sep=""))[,2]

mean_std_features <- grepl("std|mean", features)
out_subject_test <- read.table(paste(basepath,"test/subject_test.txt",sep=""))
out_X_test <- read.table(paste(basepath,"test/X_test.txt", sep=""))
out_y_test <- read.table(paste(basepath,"test/y_test.txt",sep=""))

names(out_X_test) = features

out_X_test = out_X_test[,mean_std_features]
out_y_test[,2] = activity_labels[out_y_test[,1]]
names(out_y_test) = c("Activity_ID", "Activity_Label")
names(out_subject_test) = "subject"

bind_test_data <- cbind(as.data.table(out_subject_test), out_y_test, out_X_test)

out_X_train <- read.table(paste(basepath,"train/X_train.txt", sep=""))
out_y_train <- read.table(paste(basepath,"train/y_train.txt", sep=""))
out_subject_train <- read.table(paste(basepath,"train/subject_train.txt", sep=""))
names(out_X_train) = features
out_X_train = out_X_train[,extract_features]
out_y_train[,2] = activity_labels[out_y_train[,1]]
names(out_subject_train) = "subject"
names(out_y_train) = c("Activity_ID", "Activity_Label")

bind_train_data <- cbind(as.data.table(subject_train), out_y_train, out_X_train)

merge_data = rbind(bind_test_data, bind_train_data)

id_labels = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(merge_data), id_labels)
melt_data = melt(merge_data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidydataset = dcast(melt_data, subject + Activity_Label ~ variable, mean)

tidydataset


