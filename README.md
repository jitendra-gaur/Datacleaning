Datacleaning
============
Steps mentioned as below to create tidy data set
1) Reading test and training data sets and combine the two datasets by using rbind and assigning after combining the data to variable Data1.
2) Reading test subject and training subject data sets and combine the two datasets by using rbind and assigning after combining the data to variable Subject1.
3) Reading test subject and training subject data sets and combine the two datasets by using rbind and assigning after combining the data to variable Label1.
4) Removing all the unused dataset as they are not used any more.
5) Reading Features List. We will use it as column names for data
6) Use only names from features list
7) Logical Vector to keep only std and mean columns
8) Keep only data we want, and name it human readable
9) Read ActivityList (to add descriptive names to data set)
10) Create first tidy data set
11) Create second tidy data set with avg of each var for each act and each sub
