##Merges the training and the test sets to create one data set.
  setwd("D:\\rprogram\\dataclean\\UCI HAR Dataset") 
 x_train<- read.table("D:\\rprogram\\dataclean\\UCI HAR Dataset\\train\\X_train.txt")
 y_train<- read.table("D:\\rprogram\\dataclean\\UCI HAR Dataset\\train\\y_train.txt")
 subject_train<- read.table("D:\\rprogram\\dataclean\\UCI HAR Dataset\\train\\subject_train.txt")
 x_test<- read.table("D:\\rprogram\\dataclean\\UCI HAR Dataset\\test\\X_test.txt")
 y_test<- read.table("D:\\rprogram\\dataclean\\UCI HAR Dataset\\test\\y_test.txt")
 subject_test<- read.table("D:\\rprogram\\dataclean\\UCI HAR Dataset\\test\\subject_test.txt")
data<-cbind (rbind(subject_train,subject_test),rbind(y_train,y_test),rbind(x_train,x_test))

 ##Extracts only the measurements on the mean and standard deviation for each measurement. 
features<-read.table("D:\\rprogram\\dataclean\\UCI HAR Dataset\\features.txt")
matchmean<-agrep("mean()",features$V2,max.distance = 0.1, costs = NULL,
                 ignore.case = FALSE, value = FALSE, fixed = TRUE,
                 useBytes = FALSE)#  the index of variables match the mean().
matchstd<-agrep("std()",features$V2,max.distance = 0.1, costs = NULL,
                ignore.case = FALSE, value = FALSE, fixed = TRUE,
                useBytes = FALSE)
matchmean<-matchmean+2
matchstd<-matchstd+2
match<-union(matchmean,matchstd)
c<-seq(1,2)
match<-union(c,match)
data1<-data[,match]

 ##Uses descriptive activity names to name the activities in the data set
activity_labels<-read.table("D:\\rprogram\\dataclean\\UCI HAR Dataset\\activity_labels.txt")
  data1$V1.1<-activity_labels[match(data1$V1.1,activity_labels$V1),2]
  
 ##Appropriately labels the data set with descriptive variable names. 
  name_col<-cbind("subject","activity",t(as.character(features[union(matchmean-2,matchstd-2),2])) )
  colnames(data1) <- name_col
  
 ##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  library(dplyr)
  ###creates a tidy data set with the average of each variable for each subject.
  data<-data.frame()
     for(i in 1:30){ 
   data2<-filter(data1,data1$subject==i)
   ave<-sapply(data2[,3:68], mean)
   data<-rbind(data,ave)
       }
  c<-seq(1:30)
  subject_ave<-cbind(c,data)
name_col1<-cbind("subject",t(as.character(features[union(matchmean-2,matchstd-2),2])) )
colnames(subject_ave) <- name_col1
write.table(subject_ave,"D:\\rprogram\\dataclean\\subject_ave.txt",row.name=FALSE )
   ###creates a tidy data set with the average of each variable for each activity. 
 dat<--data.frame()  
 for(i in activity_labels$V2){ 
   data3<-filter(data1,data1$activity==i)
   ave1<-sapply(data3[,3:68], mean)
   dat<-rbind(dat,ave1)
 }
 c1<-activity_labels$V2
 activity_ave<-cbind(c1,dat)
 name_col2<-cbind("activity",t(as.character(features[union(matchmean-2,matchstd-2),2])) )
colnames(activity_ave) <- name_col2
  write.table(activity_ave,"D:\\rprogram\\dataclean\\activity-ave.txt",row.name=FALSE )
 
