function tenfold()

[x,y] = loaddata('cleandata_students.txt');
for i = 1:10
	[training,validation,trainingTargets,validationTargets] = splitData(x,y,i);
	trees = getTrees(training,trainingTargets);
	predictions = testTrees(trees,validation)
end

function [trees] = getTrees(examples,targets)
attributes = getAUArray();
trees = [];
for i = 1:6
	mappedTargets = remap(i,targets);
	trees = horzcat(trees,DecisionTreeLearning(examples,attributes,mappedTargets)); 
end
