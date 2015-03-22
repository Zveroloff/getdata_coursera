# Tidy HAR dataset
## Tidy set of human activity data collected using Galaxy SII smaartphones.


This repo contains the script used to tidy up the raw HAR data.

### Source:
A a set of raw data from users' devices. The set is prepared to be processed by ML programs.
It is divided into training an test sets.

### The structure is:
```
/
-train/
  - Inertial signals/
    ...
  -subject_train.txt
  -X_train.txt
  -y_train.txt
-test/
  -Intertial Signals/
    ...
  -subject_train.txt
  -X_train.txt
  -y_train.txt
-activity_labels.txt
-features.txt
-features_info.txt
-README.txt
```

During the processing only the variables storing the mean and standard deviation values for measurements were used.
According to feature_info.txt, this values were marked with mean() and std() subsequently.
The basic flow of the script is:
1. Read the test and train set, merge the parts.
2. Add activity name column to the dataset.
3. Select columns
4. Set the variable names
5. Compute the mean for each column.
6. Write out the results.

The results (resultSet.txt) contains the mean values for the mean and standard deviation for each variable for each activity.