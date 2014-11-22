Variables

    testData - table contents of test/X_test.txt
    trainData - table contents of train/X_train.txt
    Data1 - Measurement data. Combined data set of the two above variables
    testSub - table contents of test/subject_test.txt
    trainSub - table contents of test/subject_train.txt
    Subject1 - Subjects. Combined data set of the two above variables
    testLabel - table contents of test/y_test.txt
    trainLabel - table contents of train/y_train.txt
    Label1 - Data Labels. Combined data set of the two above variables.
    featuresList - table contents of features.txt
    features - Names of for data columns derived from featuresList
    keepColumns - logical vector of which features to use in tidy data set
    activities - table contents of activity_labels.txt. Human readable
    tidyData - subsetted, human-readable data ready for output according to project description.
    uni_sub - unique subjects from Subject1
    len_sub - number of unique subjects
    len_act - number of activities
    len_name - number of columns in tidyData
    td - second tiny data set with average of each variable for each activity and subject
