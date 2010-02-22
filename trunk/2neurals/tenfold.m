function tenfold()

[x,y] = loaddata('cleandata_students.txt');
[x,y] = ANNdata(x,y);
confMatrix = zeros(6);
net = newff(PARAMS);
net.trainParam.show = ;
net.trainParam.lr = ;
net.trainParam.epochs = ;
net.trainParam.goal = ;
for i = 1:10	
	% Train and test for fold
	[training,validation,trainingTargets,validationTargets] = splitData(x,y,i);
	foldnet = train(net,training,trainingTargets);
	predictions = testANN(foldnet,validation);
	
	% Calc fold statistics
	foldMatrix = confusionMatrix(validationTargets,predictions);
	[foldRecall,foldPrecision] = recallAndPrecision(foldMatrix)
	foldfmeasure = fMeasure(1,foldRecall,foldPrecision)
	
	confMatrix = confMatrix + foldMatrix;
end
% Calc average statistics
[recall,precision] = recallAndPrecision(confMatrix)
fmeasure = fMeasure(1,recall,precision)
