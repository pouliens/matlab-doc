function tenfold();



confMatrix = zeros(6);



%net.trainParam.show = ;
%net.trainParam.lr = ;
%net.trainParam.epochs = ;
%net.trainParam.goal = ;

trainingFunctionForLayerN = {'logsig', 'purelin'};
trainingFunction = 'trainscg';
learningFunction = 'learngdm';

neuronesInLayerN = 10;

for i = 1:10	
	% Train and test for fold
    [x,y] = loaddata('cleandata_students.txt');
	[training,validation,trainingTargets,validationTargets] = splitData(x,y,i);
    orignValidationTargets = validationTargets;
    [training, trainingTargets] = ANNdata(training,trainingTargets);
    [validation, validationTargets] = ANNdata(validation, validationTargets);
    
    net = newff(training, trainingTargets, neuronesInLayerN, trainingFunctionForLayerN, trainingFunction, learningFunction );
    
    
	foldnet = train(net,training,trainingTargets);
	nnOutputs = sim(foldnet, validation);
	
    predictions = NNout2labels(nnOutputs);
    %predictions = predictions';
	% Calc fold statistics
	foldMatrix = confusionMatrix(orignValidationTargets,predictions);
	[foldRecall,foldPrecision] = recallAndPrecision(foldMatrix);
    
	foldfmeasure = fMeasure(1,foldRecall,foldPrecision);
    
    results = horzcat(foldRecall, foldPrecision, foldfmeasure);
    results'
	
	confMatrix = confMatrix + foldMatrix;
end
% Calc average statistics
confMatrix
[recall,precision] = recallAndPrecision(confMatrix);
fmeasure = fMeasure(1,recall,precision);
horzcat(recall, precision)