
#read the train, test, activity_names and features file

x_train<-read.table("./Data/train/X_train.txt")
y_train <- read.table("./Data/train/y_train.txt")
x_test <- read.table("./Data/test/X_test.txt")
y_test <- read.table("./Data/test/y_test.txt")
sub_train <- read.table("./Data/train/subject_train.txt")
sub_test<-read.table("./Data/test/subject_test.txt")
activity_name<-read.table("./Data/activity_labels.txt")
feature_names <- read.table("./Data/features.txt")
names(feature_names)<-c("Number","Name")

##STEP-1
#combine the training and test sets

x_train <- cbind(sub_train,x_train)
x_test <- cbind(sub_test,x_test)
train <- cbind(x_train,y_train)
test <- cbind(x_test,y_test)
data <- rbind(train,test)

##STEP-2
#Extract the selected features - mean() and std()

temp<- data[,c(1,ncol(data))]
names(temp)<- c("Subject","Activity")
temp2 <- data[,-c(1,ncol(data))]

names(temp2)<-gsub("^v|V","",names(temp2))
sel_feature <- feature_names[grep("mean\\()|std",feature_names$Name),]
feature_name <- as.vector(sel_feature$Name)
temp2<-temp2[,sel_feature$Number]
names(temp2)<-feature_name

data <- cbind(temp$Subject,temp2)
data <- cbind(data,temp$Activity)
names(data)[names(data) == 'temp$Subject'] <- 'Subject'
names(data)[names(data) == 'temp$Activity'] <- 'Activity'

##STEP-3
#Desciptive activity names for the action performed

data$Activity <- as.character(data$Activity)
data<-mutate(data, Activity = factor(data$Activity,labels = activity_name$V2))

##STEP-4
#Labels to add descriptive variable names for the features

names(data) <- gsub("\\()","",names(data))
names(data) <- gsub("^t","TimeDomain_",names(data))
names(data) <- gsub("^f","FreqDomain_",names(data))
names(data) <- gsub("Acc","Acceleration",names(data))
names(data) <- gsub("-mean-","_MEAN_",names(data))
names(data) <- gsub("-mean","_MEAN",names(data))
names(data) <- gsub("-std-","_STD.DEVIATION_",names(data))
names(data) <- gsub("-std","_STD.DEVIATION",names(data))
#View(data) - To view the modified dataset


##STEP-5
#Tidy data set with the average of each variable for each activity and each subject

TidyData_summary <- summarise_all(group_by(data, Subject, Activity),mean)
View(TidyData_summary)

write.table(TidyData_summary, "Tidy Dataset.txt", append = FALSE, sep = " ", dec = ".",
            row.names = TRUE, col.names = TRUE)





