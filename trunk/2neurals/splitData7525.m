function [ trainingSet, validationSet, trainingTargets, validationTargets ] = splitData4060( dataSet, targets, nthDivision )

[m, n] = size(dataSet);

validationSet = [];
trainingSet = [];
trainingTargets = [];
validationTargets = [];

offset = m / 4;
base = (nthDivision-1)*offset + 1;
divisionSet = [base:1:base+(offset-1)]

for i=1:m
    if(ismember(i,divisionSet))
        validationSet = vertcat(validationSet,dataSet(i, :));
		validationTargets = vertcat(validationTargets,targets(i));
    else
        trainingSet = vertcat(trainingSet, dataSet(i, :));
		trainingTargets = vertcat(trainingTargets,targets(i));
    end

end

end

