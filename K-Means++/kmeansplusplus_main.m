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
    indices = zeros(1, k);
    
    indices(1,1) = randperm(size(data,1),1);
    centroids(1, :) = data(indices(1,1) , :);

    i = 2;
    while i <= k
            shortest_distance_list = zeros(size(data,1), 1);

            j = 1;
            while j <= size(data,1)
                % If the data point is already a centroid, ignore it
                if ismember(i, indices) == 0
                    shortest_dist = Inf;
                    % Compare with the currently selected initial centroids
                    for c = 1 : (i - 1) 
                        distance = sum((data(j,:) - centroids(c,:)) .^ 2);
                        if distance < shortest_dist
                            shortest_dist = distance;
                        end
                    end
                    shortest_distance_list(j, 1) = shortest_dist;
                else    
                    shortest_distance_list(j, 1) = 0;
                end
                j = j+1;
            end    

            [temp,next_index] = max(shortest_distance_list);

        indices(1, i) = next_index;
        centroids(i, :) = data(indices(1, i) , :);
        i = i+1;
    end  
    

    % flag is set to "true" if the algorithm converges successfully
    flag = 0;
    prev_kmeansplusplus_cluster = zeros(size(data,1), 1);

    cluster_centroids = zeros(k, size(data,2));
    while flag == 0
        kmeans_cluster_class = kmeansplusplus_closestCentroid(data, centroids);

        if isequal(prev_kmeansplusplus_cluster, kmeans_cluster_class) == 0
            prev_kmeansplusplus_cluster = kmeans_cluster_class;
            
            for c = 1 : k
                single_cluster = data(kmeans_cluster_class == c, :);
                cluster_size = size(single_cluster, 1);
                if cluster_size > 1
                    single_cluster_sum = sum(single_cluster);
                    centroids(c,:)  = (1 / cluster_size) * single_cluster_sum;
                else
                    centroids(c,:) = single_cluster;
                end
            end
        else
            flag = 1;
        end
    end
    k = k + 1;
    objectiveFunction(k) = kmeansplusplus_objectiveFunction(data, centroids, kmeans_cluster_class);
end

keys1 = cell2mat(keys(objectiveFunction));
values1 = cell2mat(values(objectiveFunction));
kmeans_plot(keys1, values1)

fprintf("KMeans++ Successful")