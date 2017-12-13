% clear the workspace
clc;
clearvars;
clear All;
load('kmeans_data.mat','data');

% create a map of 'k' and objectiveFunction to store the result
objectiveFunction = containers.Map('KeyType','int32', 'ValueType','any');

% initialize loop from k=2 to 10
k=2;
while k<=10
    centroids = zeros(k, size(data,2));
    random_centroid_indices =  randperm(size(data,1),k);
    for i = 1 : k
        centroids(i, :) = data(random_centroid_indices(i) , :);
    end   

    % flag is set to "true" if the algorithm converges successfully
    flag = 0;
    
    prev_kmeans_cluster = zeros(size(data,1), 1);

    while flag == 0
        kmeans_cluster_class = kmeans_closestCentroid(data, centroids);
        if isequal(prev_kmeans_cluster, kmeans_cluster_class) == 0
            prev_kmeans_cluster = kmeans_cluster_class;
            
            % recompute centroids based on the formed clusters 
            centroids = zeros(k, size(data,2)); 
            c = 1;
            while c <= k
                % fetch data based on cluster number 
                cluster_data = data(kmeans_cluster_class == c, :);
                cluster_size = size(cluster_data, 1);
                % see if the cluster contains more than one records
                if cluster_size > 1
                    sum_same_cluster_data = sum(cluster_data);
                    centroids(c,:)  = sum_same_cluster_data / cluster_size;
                else
                    centroids(c,:) = cluster_data;
                end
                c = c + 1;
            end
        else
            flag = 1;
        end
    end

    objectiveFunction(k) = kmeans_objectiveFunction(data, centroids, kmeans_cluster_class);
    
    k = k+1;
end

keys1 = cell2mat(keys(objectiveFunction));
values1 = cell2mat(values(objectiveFunction));
kmeans_plot(keys1, values1)

fprintf("KMeans Successful")
