function [ trainingSet, validationSet ] = splitData( dataSet, nthDivision )
% Set trainingSet to all the rows of dataSet except nthDivision, which is validationSet 

[m, n] = size(dataSet);

validationSet = zeros(n);
trainingSet = zeros(1, n);


for i=1:m
    if(i == nthDivision)
        validationSet = dataSet(i, :);
    else
        trainingSet = vertcat(trainingSet, dataSet(i, :));
    end

end


trainingSet(1, :) = [];


end

