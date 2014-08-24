# Avarzer's Course Project for the "Getting and Cleaning Data" course offered by Johns Hopkins University

## Line-by-line description of the code

1. The working directory is set to the UCI HAR Dataset folder, which has two subfolders: test and train.
2. The features.txt file is read in. If we read in the features.txt file normally, we get a matrix with 2 columns,
with the names of the variables in the second column as a factor. Because we want to use the names later on,
we extract the second column and read the names in as strings(/characters).
3. and 4. We read in the test and train dataframes, and give them the names Xtest and Xtrain
6. and 7. We read in the subject IDs for the test and training datasets, and give them the names subjecttrain 
and subjecttest
8. We combine the subject IDs from the test dataset with the subject IDs from the train dataset,
by adding the subjecttrain data as new rows to the subjecttest data
10. and 11. We read in the activity IDs for the test and training datasets, and give them the names ytrain 
and ytest
12. We combine the activity IDs from the test dataset with the activity IDs from the train dataset,
by adding the ytrain data as new rows to the ytest data
13. We initialize ActivityLabels, which we will fill with proper names for the activities, to replace
the numberIDs
14. 15. 16. 17. 18. 19. Each element of ActivityLabels is assigned its namevalue. This could have been done more efficiently,
but this seems to be optimally readable.
21. and 22. The names of the variables named features (see 2.) are assigned to the variable values (see 3. and 4.). These names are assigned to both datasets: These have to match later on, which provides us with a small extra check.
23. The data of the variables are combined for the Xtest and the Xtrain data. This is done by adding the rows of
Xtrain to the rows of Xtest. The new dataframe is called mydata.
25. We initialize mean.or.std, which will be used to check whether names refer to a mean or a standard deviation.
26. A for-loop is started, looping through each name.
27. The last 5 characters of each name are taken.
28. 6 characters of each name are taken, skipping the last letter.
29. A logical vector is made, that for each name evaluates whether the name refers to a mean or standard deviation,
on the basis of the last 5 characters, or the 6 characters from step 28.
30. The for-loop is ended
32. A subset of the data is taken: Only the columns of which the name refers to a mean or a standard deviation
are selected for the new data. The new reduced dataframe is called mydata.subset.
34. The columns with the SubjectIDs, ActivityIDs, ActivityLabels are added to the left of mydata.subset. To save each
object separately, and to keep variablenames slightly shorter, the new object is called MyData.
35. and 36. The two first columns of the MyData object have no names. They are given their proper names: SubjectID and
ActivityID. ActivityLabels is already properly named
38. MyTidyData is initialized by calculating, using the aggregate function, the mean of the first variable
( tBodyAcc-mean()-X ) in the datafile, for each Subject and each Activity separately. 
39. A for-loop is started, because the procedure from 38. has to be performed for every variable.
Because we only take means and standard deviations, the number of variables has been greatly reduced,
to less than 70.
40. For each variable, the procedure from 38 is carried out. The resulting third column, containing the
means for each subject for each activity, is attached to the columns that were generated in earlier instances
of the loop (thereby growing the dataframe. I know this is not as advised, but it works well).
41. The loop is ended.
42. The column names of the final MyTidyData object are adjusted a bit, pasting MEAN: to the variable
names, to denote that these are now means (for every subject and every activity)

## Codebook

|Var.# |Variable                             |Description                                                                                                                      |class    |
|:--------------|:------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------|:-------------|
|1             |SubjectID                        |Participant number (30 participants)                                                                                             |integer |
|2             |ActivityLabels                   |The activities that are performed by the participants: WALKING, WALKINGUPSTAIRS, WALKINGDOWNSTAIRS, SITTING, STANDING, LAYING |character     |
|3             |MEAN:tBodyAcc-mean()-X           |Mean of axis 1 mean acceleration of the body (time domain)                                                                       |numeric |
|4             |MEAN:tBodyAcc-mean()-Y           |Mean of axis 2 mean acceleration of the body (time domain)                                                                       |numeric |
|5             |MEAN:tBodyAcc-mean()-Z           |Mean of axis 3 mean acceleration of the body (time domain)                                                                       |numeric |
|6             |MEAN:tBodyAcc-std()-X            |Mean of standard deviation of axis 1 acceleration of the body (time domain)                                                      |numeric |
|7             |MEAN:tBodyAcc-std()-Y            |Mean of standard deviation of axis 2 acceleration of the body (time domain)                                                      |numeric |
|8             |MEAN:tBodyAcc-std()-Z            |Mean of standard deviation of axis 3 acceleration of the body (time domain)                                                      |numeric |
|9             |MEAN:tGravityAcc-mean()-X        |Mean of axis 1 mean gravity acceleration of the body (time domain)                                                               |numeric |
|10            |MEAN:tGravityAcc-mean()-Y        |Mean of axis 2 mean gravity acceleration of the body (time domain)                                                               |numeric |
|11            |MEAN:tGravityAcc-mean()-Z        | Mean of axis 3 mean gravity acceleration of the body (time domain)                                                              |numeric |
|12            |MEAN:tGravityAcc-std()-X         |Mean of standard deviation of axis 1 gravity acceleration of the body (time domain)                                              |numeric |
|13            |MEAN:tGravityAcc-std()-Y         |Mean of standard deviation of axis 2 gravity acceleration of the body (time domain)                                              |numeric |
|14            |MEAN:tGravityAcc-std()-Z         |Mean of standard deviation of axis 3 gravity acceleration of the body (time domain)                                              |numeric |
|15            |MEAN:tBodyAccJerk-mean()-X       |Mean of axis 1 mean jerk from acceleration (time domain)                                                                         |numeric |
|16            |MEAN:tBodyAccJerk-mean()-Y       |Mean of axis 2 mean jerk from acceleration (time domain)                                                                         |numeric |
|17            |MEAN:tBodyAccJerk-mean()-Z       |Mean of axis 3 mean jerk from acceleration (time domain)                                                                         |numeric |
|18            |MEAN:tBodyAccJerk-std()-X        |Mean of standard deviation of axis 1 jerk from acceleration (time domain)                                                        |numeric |
|19            |MEAN:tBodyAccJerk-std()-Y        |Mean of standard deviation of axis 2 jerk from acceleration (time domain)                                                        |numeric |
|20            |MEAN:tBodyAccJerk-std()-Z        |Mean of standard deviation of axis 3 jerk from acceleration (time domain)                                                        |numeric |
|21            |MEAN:tBodyGyro-mean()-X          |Mean of axis 1 mean velocity from the gyroscope (time domain)                                                                    |numeric |
|22            |MEAN:tBodyGyro-mean()-Y          |Mean of axis 2 mean velocity from the gyroscope (time domain)                                                                    |numeric |
|23            |MEAN:tBodyGyro-mean()-Z          |Mean of axis 3 mean velocity from the gyroscope (time domain)                                                                    |numeric |
|24            |MEAN:tBodyGyro-std()-X           |Mean of standard deviation of axis 1 velocity from the gyroscope (time domain)                                                   |numeric |
|25            |MEAN:tBodyGyro-std()-Y           |Mean of standard deviation of axis 2 velocity from the gyroscope (time domain)                                                   |numeric |
|26            |MEAN:tBodyGyro-std()-Z           |Mean of standard deviation of axis 3 velocity from the gyroscope (time domain)                                                   |numeric |
|27            |MEAN:tBodyGyroJerk-mean()-X      |Mean of axis 1 mean jerk from velocity from the gyroscope (time domain)                                                          |numeric |
|28            |MEAN:tBodyGyroJerk-mean()-Y      |Mean of axis 2 mean jerk from velocity from the gyroscope (time domain)                                                          |numeric |
|29            |MEAN:tBodyGyroJerk-mean()-Z      |Mean of axis 3 mean jerk from velocity from the gyroscope (time domain)                                                          |numeric |
|30            |MEAN:tBodyGyroJerk-std()-X       |Mean of standard deviation of axis 1 jerk from velocity from the gyroscope (time domain)                                         |numeric |
|31            |MEAN:tBodyGyroJerk-std()-Y       |Mean of standard deviation of axis 2 jerk from velocity from the gyroscope (time domain)                                         |numeric |
|32            |MEAN:tBodyGyroJerk-std()-Z       |Mean of standard deviation of axis 3 jerk from velocity from the gyroscope (time domain)                                         |numeric |
|33            |MEAN:tBodyAccMag-mean()          |Mean of mean acceleration magnitude (time domain)                                                                                |numeric |
|34            |MEAN:tBodyAccMag-std()           |Mean of standard deviation of acceleration magnitude (time domain)                                                               |numeric |
|35            |MEAN:tGravityAccMag-mean()       |Mean of mean gravity acceleration magnitude (time domain)                                                                        |numeric |
|36            |MEAN:tGravityAccMag-std()        |Mean of standard deviation of gravity acceleration magnitude (time domain)                                                       |numeric |
|37            |MEAN:tBodyAccJerkMag-mean()      |Mean of mean body acceleration jerk magnitude (time domain)                                                                      |numeric |
|38            |MEAN:tBodyAccJerkMag-std()       |Mean of standard deviation of body acceleration jerk magnitude (time domain)                                                     |numeric |
|39            |MEAN:tBodyGyroMag-mean()         |Mean of mean body velocity magnitude from gyroscope (time domain)                                                                |numeric |
|40            |MEAN:tBodyGyroMag-std()          |Mean of standard deviation of body velocity magnitude from gyroscope (time domain)                                               |numeric |
|41            |MEAN:tBodyGyroJerkMag-mean()     |Mean of mean body jerk magnitude from velocity from gyroscope (time domain)                                                      |numeric |
|42            |MEAN:tBodyGyroJerkMag-std()      |Mean of standard deviation of body jerk magnitude from velocity from gyroscope (time domain)                                     |numeric |
|43            |MEAN:fBodyAcc-mean()-X           |Mean of axis 1 mean acceleration of the body (frequency domain)                                                                  |numeric |
|44            |MEAN:fBodyAcc-mean()-Y           |Mean of axis 2 mean acceleration of the body (frequency domain)                                                                  |numeric |
|45            |MEAN:fBodyAcc-mean()-Z           |Mean of axis 3 mean acceleration of the body (frequency domain)                                                                  |numeric |
|46            |MEAN:fBodyAcc-std()-X            |Mean of standard deviation of axis 1 acceleration of the body (frequency domain)                                                 |numeric |
|47            |MEAN:fBodyAcc-std()-Y            |Mean of standard deviation of axis 2 acceleration of the body (frequency domain)                                                 |numeric |
|48            |MEAN:fBodyAcc-std()-Z            |Mean of standard deviation of axis 3 acceleration of the body (frequency domain)                                                 |numeric |
|49            |MEAN:fBodyAccJerk-mean()-X       |Mean of axis 1 mean jerk from acceleration (frequency domain)                                                                    |numeric |
|50            |MEAN:fBodyAccJerk-mean()-Y       |Mean of axis 2 mean jerk from acceleration (frequency domain)                                                                    |numeric |
|51            |MEAN:fBodyAccJerk-mean()-Z       |Mean of axis 3 mean jerk from acceleration (frequency domain)                                                                    |numeric |
|52            |MEAN:fBodyAccJerk-std()-X        |Mean of standard deviation of axis 1 jerk from acceleration (frequency domain)                                                   |numeric |
|53            |MEAN:fBodyAccJerk-std()-Y        |Mean of standard deviation of axis 2 jerk from acceleration (frequency domain)                                                   |numeric |
|54            |MEAN:fBodyAccJerk-std()-Z        |Mean of standard deviation of axis 3 jerk from acceleration (frequency domain)                                                   |numeric |
|55            |MEAN:fBodyGyro-mean()-X          |Mean of axis 1 mean velocity from the gyroscope (frequency domain)                                                               |numeric |
|56            |MEAN:fBodyGyro-mean()-Y          |Mean of axis 2 mean velocity from the gyroscope (frequency domain)                                                               |numeric |
|57            |MEAN:fBodyGyro-mean()-Z          |Mean of axis 3 mean velocity from the gyroscope (frequency domain)                                                               |numeric |
|58            |MEAN:fBodyGyro-std()-X           |Mean of standard deviation of axis 1 velocity from the gyroscope (frequency domain)                                              |numeric |
|59            |MEAN:fBodyGyro-std()-Y           |Mean of standard deviation of axis 2 velocity from the gyroscope (frequency domain)                                              |numeric |
|60            |MEAN:fBodyGyro-std()-Z           |Mean of standard deviation of axis 3 velocity from the gyroscope (frequency domain)                                              |numeric |
|61            |MEAN:fBodyAccMag-mean()          |Mean of mean acceleration magnitude (frequency domain)                                                                           |numeric |
|62            |MEAN:fBodyAccMag-std()           |Mean of standard deviation of acceleration magnitude (frequency domain)                                                          |numeric |
|63            |MEAN:fBodyBodyAccJerkMag-mean()  |Mean of mean body acceleration jerk magnitude (frequency domain)                                                                 |numeric |
|64            |MEAN:fBodyBodyAccJerkMag-std()   |Mean of standard deviation of body acceleration jerk magnitude (frequency domain)                                                |numeric |
|65            |MEAN:fBodyBodyGyroMag-mean()     |Mean of mean body velocity magnitude from gyroscope (frequency domain)                                                           |numeric |
|66            |MEAN:fBodyBodyGyroMag-std()      |Mean of standard deviation of body velocity magnitude from gyroscope (frequency domain)                                          |numeric |
|67            |MEAN:fBodyBodyGyroJerkMag-mean() |Mean of mean body jerk magnitude from velocity from gyroscope (frequency domain)                                                 |numeric |
|68            |MEAN:fBodyBodyGyroJerkMag-std()  |Mean of standard deviation of body jerk magnitude from velocity from gyroscope (frequency domain)                                |numeric |

