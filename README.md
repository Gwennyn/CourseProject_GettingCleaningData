CourseProject_GettingCleaningData
=================================

This repository contains all files for the Course Project for the Course Getting and Cleaning Data on Coursera.

In this README it is stated how the script run_analysis.R works. The code can be found in the forementioned script, and the codebook describes the variables in the dataset.

The script works as follows:
- First the data is loaded (the dataset has to be downloaded beforehand from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and put in the working directory).
- The raw output data from the test and train dirs is combined with the column headers in the features file, so we know which measurement corresponds to which variable.
- Only the columns about mean and standard deviation are kept.
- Then the activities and subjects (given with numbers) are combined with the data, with descriptive column headers.
- Then the activitylabels are added (no longer numbers but comprehensive descriptions).
- Finally the result is grouped by subject and activity and the summarized to get a tidy dataset with the mean values of all the differenct parameters per subject per activity.
