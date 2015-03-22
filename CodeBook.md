# The code book

## Experimental design and background:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.


## Raw data:
The raw data from source (t riaxial acceleration from the accelerometer, estimated body acceleration values and triaxial Angular velocity from the gyroscope) were transformed and expresed with 561-feature vectors with time and frequency domain variables. These vectors were stored in X_train.txt and X_test.txt.
Activities were denoted with an ID and stored in a separate similarly ordered files. The activity IDs were mapped to the labels in activity_labels.txt. An identifier of the subject who carried out the experiment were stored in in Y_train.txt and X_test.txt.

## Codebook:
The train and test sets were merged together with addition of sctivity labels for each observation. The activity names were marked as ac.names variable, which takes the following values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. The feature variables were given with descriptive names by the following principle:
- prefix (t or f) denotes the domain of the signal, time or frequency;
- shorthand for the signal, there are 17 signals, where the Body stands for the body component, Gravity for the gravity component, Gyro stands for the gyroscope signals and Acc for the accelerometer signals. Mag means the magnitude of a signal, Jerk means the jerk signal, which is linear acceleration and angular velocity derived in time.
- mark of the value, is it standard deviation or the mean.
- the axis component, if applicable.
The typical name is: tBodyAcc.mean.X that means that variable stores the mean value for X-axis body component of the accelerometer signal. For each variable the mean value were calculated by the activity, so the result set contains only 6 rows.