function [ predictions ] = testTrees( T, x )
%TESTTREES, T = decision trees, x is input data
%   Output a vector of label predictions given data and decision trees

predictions = [];

[m,n] = size(x);

for i = 1:m
	bools = [];
	vals = [];
    for j=1:length(T)
        [bool,val] = evaluateTree(T(j), x(i, :));
    	bools = horzcat(bools,bool);
		vals = horzcat(vals,val);
	end
	positives = find(bools);
	if (isempty(positives))
		% All no case
		predictions = horzcat(predictions,randMax(vals));
	else
		% Some yes
		predictions = horzcat(predictions,randMin(positives,vals));
	end
end

function [result] = randMax(vals)
maximum = max(vals);
maximums = [];
for i = 1:length(vals)
	if(vals(i) == maximum)
		maximums = horzcat(maximums,i);
	end
end
index = randInt(1,length(maximums));
result = maximums(index);

function [result] = randMin(positives,vals)
newVals = 0;
for i = 1:length(positives)
	newVals(i) = vals(positives(i));
end
minimum = min(newVals);
minimums = [];
for i = 1:length(positives)
	if(newVals(i) == minimum)
		minimums = horzcat(minimums,positives(i));
	end
end
index = randInt(1,length(minimums));
result = minimums(index);


function [x] = randInt(m,n)
x = floor((n-m+1)*rand+m);


