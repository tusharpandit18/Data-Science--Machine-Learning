function dist_mat = knn_cv_Calc_dist_mat(training_data, testing_data) 

    % create a zero distance matrix
    dist_mat = zeros(size(testing_data,2),size(training_data,2));

    % create a zero class test matrix
    %class_test_nn = zeros(size(testing_data,2),1);

    % compute the euclidean distance and populate the matrix
    for testIndex = 1 : size(testing_data,2)
        test_image = testing_data(:,testIndex);
        for trainIndex = 1:size(training_data,2)
            image = training_data(:,trainIndex);
            difference_vector = image - test_image;
            distance = sqrt(sum(difference_vector .^ 2));
            dist_mat(testIndex, trainIndex) = distance;    
        end    
    end
end
