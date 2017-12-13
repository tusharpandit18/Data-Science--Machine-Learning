% clear the workspace
clc;
clearvars;
clear All;

load('knn_data.mat');

[train_shuffle_data, train_shuffle_label] = knn_cv_shuffle(train_data, train_label);

partitionSize = 1000;

% training data
trainingData = transpose(train_shuffle_data);
trainingLabels = train_shuffle_label;

% testing data
testing_data = transpose(test_data);
testing_labels = test_label;

[accuracy, NN, avg_result] = knn_cv_calculate_accuracy(trainingData, trainingLabels, partitionSize);

fprintf('\n Maximum accuracy of %d is for %dnn', accuracy, NN); 
knn_cv_plot(avg_result);


% code to calculate accuracy for test_Data
test_accuracy = knn_cv_calcAccuracyForTestData(trainingData,trainingLabels, testing_data, testing_labels, NN);
fprintf("\n Accuracy on test data is %d",test_accuracy);
