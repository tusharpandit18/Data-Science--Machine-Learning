function accuracies = pca_knn_cv_result(testing_labels, nn)
    acc = sum(testing_labels == nn) / numel(testing_labels);
    percentage = 100 * acc;
    accuracies(1,1) = percentage;
end