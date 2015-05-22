# Project Codebook

This is the Codebook that describes the variables used in the analysis, as well as the variables in the final dataset. 

## Analysis variables

The following variables are read directly from the initial data .txt files with the same name:

subject_test
X_test
y_test
subject_train
X_train
y_train
activity_labels
features

---

The following variables were the result of processing and merging: 

test_merged- combination of all "test" datasets
train_merged- combination of all "train" datasets
merged_data- combination of the "test" and "train" datasets

mean_std_data- the merged data, selecting only subject id, activity, and mean and std variables

final_data- the final dataset that is written to a file, which computes the mean for each variable, for each subject and activity

## Variables in the final data set

subject_id- identifies the subject. Its range is from 1 to 30. 
activity- the activity that the subject did. 

The other variables are measurements that have been normalized to a scale from -1 to 1.  
The first letter is either "t" of "f". "t" stands for "time domain" and "f" stands for "frequency domain". 
The next part is the quantity being measured. 
-mean() and -std() stands for mean and standard deviation, respectively. 
The last letter, "X", "Y", or "Z", is the directional component of the measurement. 