# First:
#   - load the feature names to label the data set with descriptive variable names
#   - load the activity labels to provide descriptive activity names
#   - determine which columns contain mean and standard deviation measurements to extract only those values later
feature_names = read.table('features.txt')
activity_labels <- read.table('activity_labels.txt')
mean_cols <- grep("mean", feature_names[,2])
std_cols <- grep("std", feature_names[,2])
final_cols = sort(c(mean_cols, std_cols))
feature_names = feature_names[final_cols,]

# Next, load the test dataset and provide appropriate labels and activity labels, extracting only mean and std measurements
x_test <- read.table('test/X_test.txt')
x_test <- x_test[, final_cols]
y_test <- read.table('test/y_test.txt')
test_subj <- read.table('test/subject_test.txt')
names(x_test) = feature_names[,2]
names(y_test) = c("Activity")
y_test$Activity = activity_labels[y_test$Activity,2]
names(test_subj) = c("Subject")
test_data <- cbind(test_subj, y_test, x_test)

# Next, load the train dataset and provide appropriate labels and activity labels, extracting only mean and std measurements
x_train <- read.table('train/X_train.txt')
x_train <- x_train[, final_cols]
y_train <- read.table('train/y_train.txt')
train_subj <- read.table('train/subject_train.txt')
names(x_train) = feature_names[,2]
names(y_train) = c("Activity")
y_train$Activity = activity_labels[y_train$Activity,2]
names(train_subj) = c("Subject")
train_data <- cbind(train_subj, y_train, x_train)

# Now, create a dataset with both test and train data. We add a descriptive "Dataset" column to indicate which dataset each row is originally from.
test_dataset <- data.frame(matrix("TEST", nrow = nrow(y_test), ncol = 1))
names(test_dataset) <- c("Dataset")
test_data <- cbind(test_dataset, test_data)
train_dataset <- data.frame(matrix("TRAIN", nrow = nrow(y_train), ncol = 1))
names(train_dataset) <- c("Dataset")
train_data <- cbind(train_dataset, train_data)
all_data <- rbind(test_data, train_data)

# Finally, create the tidy data with assistance from the reshape2 package and write it out
library(reshape2)
measure_vars <- names(all_data)
measure_vars = measure_vars[4:length(measure_vars)]
melt_data <- melt(all_data, id.vars=c("Subject", "Activity"), measure.vars=measure_vars)
tidy_data <- dcast(melt_data, Activity + Subject ~ variable, mean)
write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)
