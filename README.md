# getting-and-cleaning-data


You should create one R script called run_analysis.R that does the following.

    - Merges the training and the test sets to create one data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement.
    - Uses descriptive activity names to name the activities in the data set
    - Appropriately labels the data set with descriptive activity names.
    - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps

    a) Download the data source and save it on your local drive. Unzip the file and you have  the UCI HAR Dataset folder.
    b) Put run_analysis.R in the parent folder of UCI HAR Dataset
    c) Run source("run_analysis.R"), then it will generate a new file tiny_data.txt in your working directory.
