% produces a 6x6 confusion matrix when given a vector of the actual values
% and a vector of the values after classification
function [matrix] = confusionMatrix(targets, results)
    matrix = zeros(6);
           
    for i = 1:length(targets)
        matrix(targets(i), results(i)) = matrix(targets(i), results(i)) + 1;
    end