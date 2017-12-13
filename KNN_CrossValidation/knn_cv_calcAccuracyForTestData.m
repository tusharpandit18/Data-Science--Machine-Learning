function test_accuracy = knn_cv_calcAccuracyForTestData(train_data, train_labels, test_Data, test_labels, NN)
    dist_mat_test_data = knn_cv_Calc_dist_mat(train_data, test_Data);
    test_knnclass = knn(dist_mat_test_data, test_Data, train_labels, train_data, NN);
    test_accuracy = knn_cv_result(test_labels, test_knnclass);
end