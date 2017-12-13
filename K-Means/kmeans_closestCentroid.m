function kmeans_cluster = kmeans_closestCentroid(data, centroids)

kmeans_cluster = zeros(size(data,1), 1);

i = 1;
while i < size(data,1)
    min_distance = Inf;
    nearest_centroid_index = 0;
    for c = 1 : size(centroids,1)
        distance_from_centroid = sum((data(i,:) - centroids(c,:)) .^ 2);
        % find minimum
        if distance_from_centroid < min_distance
            min_distance = distance_from_centroid;
            nearest_centroid_index = c;
        end
    end
    kmeans_cluster(i, 1) = nearest_centroid_index;
    i = i+1;
end

