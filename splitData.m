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

%this is retarded but it works... should be setting dimensions in the zeros
%statement...
trainingSet(1, :) = [];


end

