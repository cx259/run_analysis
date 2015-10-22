# run_analysis
the course project of Getting and Cleaning Data
1. Script Works 
  
  a.Merges the training and the test sets to create one data set.
  Reading the data from files:X_train.txt,y_train.txt,subject_train.txt,X_test.txt,y_test.txt,and subject_test.txt.
  Merging the data as:"subject", "y",and "x",where the data of train is upper on the data of test.
  Getting "data"
  
  b. Extracts only the measurements on the mean and standard deviation for each measurement.
  Reading the names of variables from the file features.txt.
  Finding the  index of variables match the mean() and std().
  adding 2 to the index  for we merging the variables as columes from 3 colume in step a.
  subseting the columes we chosened and the colume of "subject" and "y".
  Getting "data1"

  c.Uses descriptive activity names to name the activities in the data set
  Reading the data frome the file:activity_labels.txt.
  Matching the second colume of data1 with the first colume of activity_labels.
  replacing the data in second colume of "data1" by the activity_labels.
  
  d.Appropriately labels the data set with descriptive variable names. 
  combinding  "subject","activity",and the names of variables.
  Using  the names to name the colume of "data1"
  
  e.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for   each activity and each subject.
    creates a tidy data set with the average of each variable for each subject.
    creates a tidy data set with the average of each variable for each activity.
  
2. Code Book Describing Variables
    x_train,y_train,subject_train-----the data read from files:X_train.txt,y_train.txt,subject_train.txt
    X_test,y_test,and subject_test-----the data read from files:X_test.txt,y_test.txt,and subject_test.txt
    data------the data we Merges the training and the test sets to create one data set
    
    features-----the data read from file:features.txt
    matchmean----the index of variables match the mean() in "features"
    matchstd----the index of variables match the std() in "features"
    match----the index of variables match the mean and std in "data" 
    data1----the measurements on the mean and standard deviation for each measurement in "data"

    activity_labels----the data read from files:activity_labels.txt.
   
    name_col---the names of the column of "data1"
    
    subject_ave---a tidy data set with the average of each variable for each subject
    activity_ave--- tidy data set with the average of each variable for each activity
    
    
