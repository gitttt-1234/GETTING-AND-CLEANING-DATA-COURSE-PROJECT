# GETTING-AND-CLEANING-DATA-COURSE-PROJECT
## Tidy data assignment


### Human Activity Recognition Using Smartphones Dataset
Version 1.0


The dataset includes the following files:


'features_info.txt': the variables on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'X_train.txt': Training set containing the values of the feature vector.

'y_train.txt':  activity.

'X_test.txt': Test set.

'y_test.txt': activity.

'subject_train.txt': Each row identifies the subject who performed the activity. Its range is from 1 to 30. 
 
The 'Inertial signals folder' consists of the raw signals from the accelrometer and gyrometer. However, the consolidated values are present in the x_train and x_test files and hence the inertial signals folder is not considered for the cleaning the dataset.


*Note:* 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


The above files are combined into one single dataset following the tidy data principles. The final data set is the "Tidy Dataset.txt" file which has the summary of means of the features for each activity and each subject. This text file can be read by using the *read.table("Tidy Dataset.txt")* function. The code for converting the raw untidy data into a tidy data is available in the 'run_analysis.r' file. 

For further details regarding the procedure, refer *CodeBook.md* file.

