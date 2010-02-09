function [ predictions ] = testTrees( T, x )
%TESTTREES, T = decision trees, x is input data
%   Output a vector of label predictions given data and decision trees

predictions = [];

[m,n] = size(x);

for i = 1:m
    for j=1:length(T)
        if(evaluateTree(T(j), x(i, :)) == 1)
              predictions = horzcat(predictions, j);
              break;
        end
    end
end

