function kmeans_plot(keys, values)
    % Plot k vs objective function 
    RGB = [255 153 153]/256 ;

    scatter(keys, values,[],RGB, 'filled');
    title('K-means');
    xlabel('K')
    ylabel('Objective Function');
end