- There are 5,000 instances and 1,598 instances in the training set and test set, and each instance has 166 features. 

- Implemented 5-fold cross validation to choose the parameter k for kNN classifier, where k ranges from 1 to 17 (odd k's only)

- Implemented 5-fold cross validation for kNN and plot the average accuracy on the
validation set vs. each possible k. 

- Now used PCA to reduce the dimensionality of the data from 166 to 50.

- Then on this new reduced dataset, implemented 5-fold cross validation for kNN and ploted the
average accuracy on the validation set vs. each possible k. 

- Chose the best parameter based on these accuracies and use it to predict on the test data. 

- Finally, reported the parameter k, as well as the corresponding accuracy on the test data.