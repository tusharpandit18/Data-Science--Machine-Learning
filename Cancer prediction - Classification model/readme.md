- Read the dataset into a pandas dataframe object (dataset available on 'https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data')

- Separated the independent and dependant variables

- Transformed the class labels from their original string representation (M - Malignant and B - Benign) to integers

- Divided the dataset into 80% training and 20% separate test data

- Created a pipeline with the following steps chained to each other
----- For optimal performance transformed all feature values into the same scale - standardized the columns before feeding them to the classifier
----- Compress the initial 30 dimensional data into a lower 2 dimensional space using PCA
----- Applied the logistic regression algorithm

- Fitted the training data into the model

- Compute the accuracy of the model on test data

- Instead of just a single test on test data, performed a stratified k-fold cross validation on training data

- Computed accuracy, precision, recall, f1-score by using confusion matrix and classification report
