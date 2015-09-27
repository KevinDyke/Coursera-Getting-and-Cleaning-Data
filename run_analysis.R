# Coursera Getting and Cleaning Data Project Sept 2015

library(plyr)

# Step 1 merge the training and test sets together to create one file

# load the training and test sets and merge into one data set
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/Y_train.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/Y_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

# merge datasets
merged_x <- rbind(x_test,x_train)
merged_y <- rbind(y_test,y_train)
merged_subject <- rbind(subject_test,subject_train)

# Step 2 Extracts only the measurements on the mean and standard deviation for each measurement.
# The only columns needed have features names including mean() or std()

# load in the features file - we are only interested in the second column
features <- read.table("features.txt")[,2]

# extract only column names with mean() or std() in their names
required_features <- grep("-(mean|std)\\(\\)", features)

# extract the required columns 
merged_x <- merged_x[,required_features]

# change the column names to reflect the ones in the feature file
names(merged_x) <- features[required_features]

# Step 3 Uses descriptive activity names to name the activities in the data set

# get the activity labels and ensure only it only contains character data
activity <- read.table("activity_labels.txt")
activity[,2] <- as.character(activity[,2])

# update values with correct activity names

# change the activity values in the y dataset from numbers to words
merged_y[, 1] <- activity[merged_y[, 1], 2]

# and change the column name from V1 to something more meaningful
names(merged_y) <- "activity"

# Step 4 Appropriately labels the data set with descriptive variable names.

# change the columns with names including "-mean" to "_Mean_"
names(merged_x) <- gsub('-mean', '_Mean_', names(merged_x))

# change the columns with names including "-std" to "_Std_"
names(merged_x) <- gsub('-std', '_Std_', names(merged_x))

# remove the brackets from any columns names
names(merged_x) <- gsub('[()-]', '', names(merged_x))

# replace any columns names including double instance of "Body" to a single instance
names(merged_x) <- gsub('BodyBody', 'Body', names(merged_x))

# replace the column name in the merged subject dataset from "V1" to "Subject"
names(merged_subject)[1] <- "subject"

# Step 5 From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

# bind all the data in a single data set
completed_data <- cbind(merged_x,merged_y, merged_subject)

# move the indexing columns (subject and activity) from the back to the front of the datasets
completed_data <- completed_data[c(67,68,1:66)]

# Calculate the average data for all but the first two columns
averages <- ddply(completed_data, .(subject, activity), function(x) colMeans(x[, 3:68]))
# write the table 
write.table(averages, "average_tidy_data.txt", row.name=FALSE)




