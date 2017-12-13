function summation = kmeans_objectiveFunction(data, centroids, cluster)

summation = 0;
i = 1;
while i <= size(centroids, 1)
    c_data = data(cluster == i, :);
    c_size = size(c_data, 1);
    j = 1;
    while j<= c_size
       summation = summation + sum((c_data(j,:) - centroids(i,:)) .^ 2);
       j = j+1;
    end
    i = i + 1;
end

