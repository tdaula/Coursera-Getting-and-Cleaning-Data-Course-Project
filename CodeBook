<h3>General description</h3>
Location of data: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

<h3>Variables</h3>
More detailed information found in the "features_info.txt" file of the archive.

Final variable names:
<ul>
  <li> tBodyAcc-STAT-XYZ </li>
  <li> tGravityAcc-STAT-XYZ </li>
  <li> tBodyAccJerk-STAT-XYZ </li>
  <li> tBodyGyro-STAT-XYZ </li>
  <li> tBodyGyroJerk-STAT-XYZ </li>
  <li> tBodyAccMag-STAT </li>
  <li> tGravityAccMag-STAT </li>
  <li> tBodyAccJerkMag-STAT </li>
  <li> tBodyGyroMag-STAT </li>
  <li> tBodyGyroJerkMag-STAT </li>
  <li> fBodyAcc-STAT-XYZ </li>
  <li> fBodyAccJerk-STAT-XYZ </li>
  <li> fBodyGyro-STAT-XYZ </li>
  <li> fBodyAccMag-STAT </li>
  <li> fBodyAccJerkMag-STAT </li>
  <li> fBodyGyroMag-STAT </li>
  <li> fBodyGyroJerkMag-STAT </li>
</ul>

Where "XYZ" means there is a separate variable for each axis, e.g. tBodyAcc-X, tBodyAcc-Y, tBodyAcc-Z; STAT corresponds to
"mean" or "std".

<h3>Description of run_analysis.R</h3>
<ol>
  <li> R script extracts the time-summarized data from the archive.  This includes time-means, standard deviations, min,
max, etc. See README_rawdata.txt. </li>
  <li> Pulls the subject and activity labels and merges them with the testing and training data sets.</li>
  <li> Appends the testing data to the training data. </li>
  <li> Relabels the data frame according to the archived "features.txt" list, and removes "()" from name. </li>
  <li> Creates factor variable with informative labels for "activity". </li>
  <li> Keeps columns corresponding to the mean and standard deviation. </li>
  <li> Creates new ensemble mean for each subject (1 to 30) and each activity (1 to 6).  Outputs this dataset. </li>
</ol>
