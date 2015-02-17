## run_analysis.R
## Create a tidy data set for Human Activity Recognition Using Smartphones
## data and an additional table of summary data.
##
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##
## Requires either that the UCI HAR Dataset.zip file is in the current working
## directory or that it has already been unzipped (and then possibly removed).
##
## Requires the reshape2 package which can be installed from CRAN.


# Try to load the needed library early so no time is wasted
# calculation and checking other things if it is missing.
library(reshape2)


# Check for required data (unpacking from zip file as needed).
if (file.exists("UCI HAR Dataset/activity_labels.txt")) {
    # assumes that if activity_labels.txt is unpacked the rest are too
    message("Using previously unpacked 'UCI HAR Dataset'.")
} else {
    if (file.exists("UCI HAR Dataset.zip")) {
        message("Unpacking 'UCI HAR Dataset'.")
        unzip("UCI HAR Dataset.zip")
    } else {
        stop("ERROR: 'UCI HAR Dataset.zip' not found in working directory.")
    }
}



### Read and clean the metadata

# Coercing activity values into more descriptive factors will 
# need these matching lists of levels and labels.
activities <- read.table("UCI HAR Dataset/activity_labels.txt", 
                         stringsAsFactors = FALSE, 
                         col.names = c("level", "label"))


# Features are stored in a table, but are already sorted by
# column number so extract just the names into a simple vector.
features <- read.table("UCI HAR Dataset/features.txt", 
                       stringsAsFactors = FALSE)[,2]

# Find the interesting features and create a vector of "numeric" and 
# "NULL" values for colClasses so that the uninteresting ones can be 
# filtered out during the read. (Explicitly marking the interesting
# ones as numeric speeds up the read).
# Only the main mean() and std() functions (which occur in pairs) are 
# selected since meanFreq() is something different and the angle 
# functions are using means as part of additional calculations.)
interesting <- ifelse(grepl("(mean|std)\\(\\)", features), "numeric", "NULL")

# Strip the function parens for better looking variable names.
features <- gsub("()","", features, fixed = TRUE)
# The fBodyBody prefix should just be fBody according to the codebook.
features <- gsub("fBodyBody","fBody", features, fixed = TRUE)
# Flip the order of mean/std and X/Y/Z so mean/std are consistently last.
features <- gsub("-(mean|std)-(X|Y|Z)","\\2-\\1", features)



### Read, organize, and clean the data

# Get the training data, starting with the subject id numbers.
traindata <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                        col.names = "subject")

# Then read the column of activity values from the y_train file,
# convert them into proper factors, and insert as the activity column.
traindata$activity <- factor(scan("UCI HAR Dataset/train/y_train.txt",
                                  integer(), quiet = TRUE),
                             activities$level, activities$label)

# Read and bind in the interesting columns of the main data set.
traindata <- cbind(traindata, read.table("UCI HAR Dataset/train/X_train.txt",
                                         col.names = features,
                                         colClasses = interesting))


# Get the test data, starting with the subject id numbers.
testdata <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                       col.names = "subject")

# Then read the column of activity values from the y_test file,
# convert them into proper factors, and insert as the activity column.
testdata$activity <- factor(scan("UCI HAR Dataset/test/y_test.txt",
                                 integer(), quiet = TRUE),
                            activities$level, activities$label)

# Read and bind in the interesting columns of the main data set.
testdata <- cbind(testdata, read.table("UCI HAR Dataset/test/X_test.txt",
                                       col.names = features, 
                                       colClasses = interesting))


# Combine the train and test data into a single data set.
data_wide <- rbind(traindata, testdata)

# Convert the subject id into a factor
data_wide$subject <- factor(data_wide$subject)

# Clean up unneeded data to retrieve some space and keep environment tidy.
rm(testdata, traindata, activities, features, interesting)



### Reshape the data into a long variant.

data_long <- melt(data_wide, id = c("subject", "activity"))



### Generate averages for all subject, activity, variable combinations.

means_wide <- dcast(data_long, subject + activity ~ variable, mean)
means_long <- melt(means_wide, id = c("subject", "activity"))


message("Generated: data_long, data_wide, means_long, means_wide")

# Export of the wide mean summary data for upload to Coursera. 
# write.table(means_wide, "tidymeans.txt", row.name = FALSE)
