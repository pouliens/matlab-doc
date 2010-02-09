function [ trainingSet, validationSet ] = splitData( dataSet, nthDivision )
% Set validationSet to rows of dataSet for nthDivision 10-fold, with rest forming trainingSet 

[m, n] = size(dataSet);

validationSet = [];
trainingSet = [];

offset = m / 10;
base = (nthDivision-1)*offset + 1;
divisionSet = [base:1:base+(offset-1)];

for i=1:m
    if(ismember(i,divisionSet))
        validationSet = vertcat(validationSet,dataSet(i, :));
    else
        trainingSet = vertcat(trainingSet, dataSet(i, :));
    end

end

end

