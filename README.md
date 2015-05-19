# Getting and Cleaning Data Course Project Readme

## Part 1: Load the data

The first step is to read the data into R. This should be self-explanatory. 

## Part 2: Give labels to the data

The "subject" and "y" variables are the subject_id and activity, respectively, so I named their columns as such. For the "X" variable, the column names are in the "features" variable.  
I changed "y" to a factor variable, and replaced the numbers with the activity names, found in the "activity_labels" variable. 

## Part 3: Merge the data

I used cbind() to merge the subject, X, and y variables. Finally, I used rbind() to merge the training and test datasets. 

## Part 4: Subset the data

We only want the mean and std variables. I used grep() to find the indices of the column names that contain "mean" or "std", and then I subsetted the data, taking only those columns as well as the subject_id and activity columns. 

## Part 5: Summarize the data

We want to take the mean of each variable, for each subject and activity. The dplyr package allows us to do that very easily. 

## Part 6: Write the data

The final step is to write the resulting data set to the disk. 
