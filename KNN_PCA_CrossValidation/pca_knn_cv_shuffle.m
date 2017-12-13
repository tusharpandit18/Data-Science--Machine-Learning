function [shuffled_trainingData, shuffled_trainLabel] = pca_knn_cv_shuffle(train_data, train_label)
    train_data_label = [train_data train_label];

    mat = train_data_label(randperm(size(train_data_label,1)),:);

    shuffled_trainingData = mat(:,1:166);
    shuffled_trainLabel = mat(:,167:167);
end