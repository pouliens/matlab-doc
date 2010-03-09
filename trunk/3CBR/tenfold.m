function tenfold();

confMatrix = zeros(6);

% Train and test for fold
[x,y] = loaddata('cleandata_students.txt');
for i = 1:10	
	[training,validation,trainingTargets,validationTargets] = splitData(x,y,i);
    cbr = CBRinit(training, trainingTargets);
	
    predictions = testCBR(cbr, validation, validationTargets);

	% Calc fold statistics
	foldMatrix = confusionMatrix(validationTargets,predictions)
	[foldRecall,foldPrecision] = recallAndPrecision(foldMatrix)
	foldfmeasure = fMeasure(1,foldRecall,foldPrecision)
	
	confMatrix = confMatrix + foldMatrix;
end
% Calc average statistics
confMatrix
[recall,precision] = recallAndPrecision(confMatrix)
fmeasure = fMeasure(1,recall,precision)
