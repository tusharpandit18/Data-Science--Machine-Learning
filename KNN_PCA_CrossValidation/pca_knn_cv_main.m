% clear the workspace
clc;
clearvars;
clear All;

load('knn_data.mat');

[train_shuffle_data, train_shuffle_label] = pca_knn_cv_shuffle(train_data, train_label);

size_of_partition = 1000;

beginning_index = 0;
end_index = size_of_partition;
k_pca = 50;
%...........................Training PCA.........................
[m, n] = size(train_shuffle_data);
U = zeros(n);
S = zeros(n);
V = zeros(n);
% Compute the covariance matrix
Sigma = train_shuffle_data'* train_shuffle_data / m;

% Compute Eigen Vectors of Sigma (use SVD or eig)
[U, S, V] = svd(Sigma);

% take first k columns
% z = U(:,1:k_pca); %n*k matrix
z = U(:,1:k_pca)' * train_shuffle_data';
train_shuffle_data = z';

%...............................................................

%......................... Testing PCA.......................
temp_testing_data = test_data;

[m1, n1] = size(temp_testing_data);
U1 = zeros(n1);
S1 = zeros(n1);
V1 = zeros(n1);
% Compute the covariance matrix
Sigma1 = temp_testing_data'* temp_testing_data / m1;

% Compute Eigen Vectors of Sigma (use SVD or eig)
[U1, S1, V1] = svd(Sigma1);

% take first k columns
% z = U(:,1:k_pca); %n*k matrix
z1 = U(:,1:k_pca)' * temp_testing_data';
temp_testing_data = z1';
%----------------------------------------------




% training data
trainingData = transpose(train_shuffle_data);
trainingLabels = train_shuffle_label;

% testing data
testing_data = transpose(temp_testing_data);
testing_labels = test_label;

[accuracy, NN, avg_result] = pca_knn_cv_calculate_accuracy(trainingData, trainingLabels, size_of_partition);

fprintf('\n PCA - Maximum accuracy of %d is for %dnn', accuracy, NN); 
knn_cv_plot(avg_result);


% code to calculate accuracy for test_Data
test_accuracy = pca_knn_cv_calcAccuracyForTestData(trainingData,trainingLabels, testing_data, testing_labels, NN);
fprintf("\n PCA - Accuracy on test data is %d",test_accuracy);


