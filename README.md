<header>
  <h1>Coursera: "Getting and Cleaning Data" Course Project</h1>
  <h3>Week 3 Course Project for Coursera's Getting and Cleaning Data within the Data Analysis in R specialization.</h3>
</header>

run_analysis.R merges testing and training data sets and their associated subjects and labels from within a zip file.
This is the primary file within the repo and requires the data to be downloaded separately.  Data should be put in the 
./data subdirectory for R script to work.

Location of data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

README_rawdata.txt provides information on the raw telemetry data.

<h3>Description of run_analysis.R</h3>
<ol>
  <li> R script extracts the time-summarized data from the archive.  This includes time-means, standard deviations, min,
max, etc.</li>
  <li> Pulls the subject and activity labels and merges them with the testing and training data sets.</li>
  <li> Appends the testing data to the training data. </li>
  <li> Relabels the data frame according to the archived "features.txt" list, and removes "()" from name. </li>
  <li> Creates factor variable with informative labels for "activity". </li>
  <li> Keeps columns corresponding to the mean and standard deviation. </li>
  <li> Creates new ensemble mean for each subject (1 to 30) and each activity (1 to 6).  Outputs this dataset. </li>
</ol>
