function [fmeasuresForFold] =  tenfold()

[x,y] = loaddata('noisydata_students.txt');
confMatrix = zeros(6);

fmeasuresForFold = [];

for i = 1:10
	[training,validation,trainingTargets,validationTargets] = splitData(x,y,i);
	trees = getTrees(training,trainingTargets);
	predictions = testTrees(trees,validation);
	
    foldConfMatrix =  confusionMatrix(validationTargets,predictions);
    confMatrix = confMatrix + foldConfMatrix;
    
    [foldrecall, foldprecision] = recallAndPrecision(foldConfMatrix);
    fmeasureFold = fMeasure(1,foldrecall,foldprecision);
    fmeasuresForFold = [fmeasuresForFold ; fmeasureFold'];
    
end
confMatrix
[recall,precision] = recallAndPrecision(confMatrix)
fmeasure = fMeasure(1,recall,precision);
fmeasuresForFold;

function [trees] = getTrees(examples,targets)
attributes = getAUArray();
trees = [];
for i = 1:6
	mappedTargets = remap(i,targets);
	trees = horzcat(trees,DecisionTreeLearning(examples,attributes,mappedTargets)); 
end
