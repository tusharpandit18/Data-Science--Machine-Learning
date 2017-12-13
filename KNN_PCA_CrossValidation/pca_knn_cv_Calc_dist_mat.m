function dist_mat = pca_knn_cv_Calc_dist_mat(training_data, testing_data) 

    % create a zero distance matrix
    dist_mat = zeros(size(testing_data,2),size(training_data,2));

    % compute the euclidean distance and populate the matrix
    i = 1;
    while i <= size(testing_data,2)
        temp = testing_data(:,i);
        j = 1;
        while j <= size(training_data,2)
            image = training_data(:,j);
            difference = image - temp;
            dist = sqrt(sum(difference .^ 2));
            dist_mat(i, j) = dist;    
        end    
        i = i + 1;
    end
end
