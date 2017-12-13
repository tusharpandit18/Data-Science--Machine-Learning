function result = knn(dist_mat, test_Data, train_labels, train_Data, knn_kVal)
    result = zeros(size(test_Data,2),1);
    i = 1;
    while i <= size(test_Data,2)
        closet_dis = Inf(1,knn_kVal);
        closet_index = zeros(1,knn_kVal);
        closet_data = zeros(1,knn_kVal);
        j=1;
        while j <= size(train_Data,2)
           distance = dist_mat(i, j);
           [maximumVal, maximumIndex] = max(closet_dis);
           % distance less than maximumVal
           if distance <= maximumVal        
               closet_dis(maximumIndex) = distance;
               closet_index(maximumIndex) = j;
           end
           j = j + 1;
        end  
        k = 1;
        while k <= size(closet_index,2)
            closet_data(k) = train_labels(closet_index(k), 1);
            k = k + 1;
        end
        result(i,1)= mode(closet_data);
        i = i + 1;
    end
end

