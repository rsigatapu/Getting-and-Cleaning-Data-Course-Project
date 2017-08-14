# Code Book

This code book will describe the variables, the data, and any transformations or work that were performed to clean up the data.

## Data Overview

30 volunteers, within an age bracket of 19-48 years, performed 6 different activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone on theirwaist. The smartphone captured data about their movements.This obtained dataset has then been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30%, the test data. 

This analysis was performed using only the files below. The data files in the "Inertial Signals" folders were ignored.

### Files -

* `X_train.txt`: Contains observations for 21 of the 30 volunteers.

* `subject_train.txt`: Identifies the volunteer who performed the activity for each of the observations in `X_train.txt`.

* `y_train.txt`: Identifies the activity related to each of the observations in `X_train.txt`.

* `X_test.txt`: Contains observations for 9 of the 30 volunteers.

* `subject_test.txt`: Identifies the volunteer who performed the activity for each of the observations in `X_test.txt`.

* `y_test.txt`: Identifies the activity related to each of the observations in `X_test.txt`.

* `features.txt`: Names of the 561 features.

* `activity_labels.txt`: Names and IDs for each of the 6 activities.


Please view more information about these files and features here - [`README.txt`](https://github.com/rsigatapu/Getting-and-Cleaning-Data-Course-Project/blob/master/README.txt) and [`features_info.txt`](https://github.com/rsigatapu/Getting-and-Cleaning-Data-Course-Project/blob/master/features_info.txt).

### Data Processing -

1. Data files realted to activity labels and features were downloaded and read into data tables. 

2. All feature columns were removed that did not contain the exact string "mean()" or "std()". 

3. All the remaining relevant data files were donwloaded and read into data tables. `X_train.txt` and `X_train.txt` were selectively loaded using the extracted feature columns.

4. The train and test datasets were combined seperately and then binded to give a single dataset.

5. Appropriate column names were assigned and descriptive activity names were given to the activities in the data set.

6. The column names of all feature variables were cleaned.

7. The averages data table was created containing the mean of each feature for each subject and each activity. Each row contains a mean value for each the 66 features for that subject and activity combination.

8. The averages data table was then written to a text file.





