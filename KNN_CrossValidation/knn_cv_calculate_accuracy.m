function [NN,accuracy, avg_result] = knn_cv_calculate_accuracy(trainingData, trainingLabels, partitionSize)
    fold = 1;
    while fold <= 5
        train_set = [];
        test_set = [];
        train_labels = [];
        test_labels = [];

        if fold ==1
            test_set = trainingData(:,1:1000);
            train_set= trainingData(:,1001:5000);

            test_labels = trainingLabels(1:1000,:);
            train_labels= trainingLabels(1001:5000,:);

        elseif fold == 5
            test_set = trainingData(:,4001:5000);
            train_set= trainingData(:,1:4000);

            test_labels = trainingLabels(4001:5000,:);
            train_labels= trainingLabels(1:4000,:);

        else 
            test_from=((fold-1) * partitionSize) + 1;
            test_to=(fold) * partitionSize;

            train_from1=1;
            train_to1=((fold-1) * partitionSize);

            train_from2=((fold) * partitionSize)+1;
            train_to2=5000;

            test_set = trainingData(:,test_from:test_to);
            train_set= [trainingData(:,train_from1:train_to1) trainingData(:,train_from2:train_to2)];

            test_labels = trainingLabels(test_from:test_to,:);
            train_labels= [transpose(trainingLabels(train_from1:train_to1,:)) transpose(trainingLabels(train_from2:train_to2,:))];
            train_labels=transpose(train_labels);
        end

        distance_matrix = knn_cv_Calc_dist_mat(train_set, test_set);

        j = 0;
        while j <= 8
            k=(2 * j)+1;
            knn_output = knn(distance_matrix, test_set, train_labels, train_set,k);
%             fprintf("knn_output %d",knn_output);
            final_matrix(fold,k) = knn_cv_result(test_labels, knn_output);
            j = j + 1;
        end

        fold = fold + 1;
    end
    avg_result =[];

    for j=1: size(final_matrix,2)
        avg_result(j) = mean(final_matrix(:,j));
    end
    [NN,accuracy] = max(avg_result);
end    