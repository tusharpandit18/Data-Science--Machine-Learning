function kmeansplusplus_plot(keys, values)
    % Plot k vs objective function
    RGB = [255 153 153]/256 ;
    scatter(keys, values,[],RGB, 'filled');
    title('Kmeans Plus Plus');
    xlabel('K')
    ylabel('Objective Function Values');

end
