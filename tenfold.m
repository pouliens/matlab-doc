function tenfold()

[x,y] = loaddata('cleandata_students.txt');
confMatrix = zeros(6);
for i = 1:10
	[training,validation,trainingTargets,validationTargets] = splitData(x,y,i);
	trees = getTrees(training,trainingTargets);
	predictions = testTrees(trees,validation);
	confMatrix = confMatrix + confusionMatrix(validationTargets,predictions);
end
confMatrix
[recall,precision] = recallAndPrecision(confMatrix)
fmeasure = fMeasure(1,recall,precision)

function [trees] = getTrees(examples,targets)
attributes = getAUArray();
trees = [];
for i = 1:6
	mappedTargets = remap(i,targets);
	trees = horzcat(trees,DecisionTreeLearning(examples,attributes,mappedTargets)); 
end
