# GETTING-AND-CLEANING-DATA-COURSE-PROJECT
## CODE BOOK

### Human Activity Recognition Using Smartphones Dataset

##### About the raw data set

The dataset contains details on the experiments that have been carried out with a group of 30 people with the ages between 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was measured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. Usinf filters, a vector of features was obtained from the accelerometer and gyroscope by calculating variables from the time and frequency domain which is stored in the x_train and x_test files containing 561 features. The complete list of variables of each feature vector is available in 'features.txt'
 
The signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
t - time domain
f- frequency domain
Acc- accleration

-tBodyAcc-XYZ
-tGravityAcc-XYZ
-tBodyAccJerk-XYZ
-tBodyGyro-XYZ
-tBodyGyroJerk-XYZ
-tBodyAccMag
-tGravityAccMag
-tBodyAccJerkMag
-tBodyGyroMag
-tBodyGyroJerkMag
-fBodyAcc-XYZ
-fBodyAccJerk-XYZ
-fBodyGyro-XYZ
-fBodyAccMag
-fBodyAccJerkMag
-fBodyGyroMag
-fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

-mean(): Mean value
-std(): Standard deviation
-mad(): Median absolute deviation 
-max(): Largest value in array
-min(): Smallest value in array
-sma(): Signal magnitude area
-energy(): Energy measure. Sum of the squares divided by the number of values. 
-iqr(): Interquartile range 
-entropy(): Signal entropy
-arCoeff(): Autorregresion coefficients with Burg order equal to 4
-correlation(): correlation coefficient between two signals
-maxInds(): index of the frequency component with largest magnitude
-meanFreq(): Weighted average of the frequency components to obtain a mean frequency
-skewness(): skewness of the frequency domain signal 
-kurtosis(): kurtosis of the frequency domain signal 
-bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
-angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

-gravityMean
-tBodyAccMean
-tBodyAccJerkMean
-tBodyGyroMean
-tBodyGyroJerkMean

The activity was recorded for every vector of features. There are six activities in total which are present in y_train and y_test files. The labels corresponding to each activity is given in activity_name.txt file. The subject file represents the person with whom the readings were observed.

##### TIDY DATA SET

To obtain the tidy data set, the following five steps were performed:

###### Step 0
all the train and test files are read (x_train, x_test, y_train, y_test, Subject_train, subject_test)
The activity_name and feature files are also loaded using read_table function.

###### Step 1
The subject, y and x files are combined using cbind
the train and test sets are combined using rbind

###### Step 2
The features that correspond to mean and std of the measurements are selected and the remaining are removed. this is done using the features.txt file. Using the grep function, the features that has mean and std can be otained and then map it to the dataset. 66 features were extracted.

###### Step 3
The activity column is numbered in the raw dataset. They are converted into labels by using the factor function. The labels corresponding to each number is given in the activity_name file.

###### Step 4
Using the names of the measurement in the features file, the variable names are added for each column. The names are modified to make it more clear.

###### Step 5
From the obtained dataset, a tidy dataset is obtained by performing the summary operation of mean of each measurement variable for each activity and each subject. 
