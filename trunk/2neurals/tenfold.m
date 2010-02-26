function [trainedNetwork] =  tenfold();

confMatrix = zeros(6);

% parameters for newff:
pr = [];
for i = 1:45
  pr = vertcat(pr, [0, 1]);
end

sizeofLayers = [15, 6];
transferFunctions = {'tansig', 'purelin'};
trainingFunction = 'trainscg';
learningFunction = 'learngdm';
performanceFunction = 'mse';


net = newff(pr, sizeofLayers, transferFunctions, trainingFunction, learningFunction, performanceFunction);

%net.trainParam.show = ;
%net.trainParam.lr = ;
net.trainParam.epochs = 500;
%net.trainParam.goal = ;

% Train and test for fold
[x,y] = loaddata('cleandata_students.txt');
for i = 1:10	
	[training,validation,trainingTargets,validationTargets] = splitData(x,y,i);
    orignValidation = validation;
    orignValidationTargets = validationTargets;
    [training, trainingTargets] = ANNdata(training,trainingTargets);
    [validation, validationTargets] = ANNdata(validation, validationTargets);   
    VV.P = validation;
    VV.T = validationTargets;    

    foldnet = train(net,training,trainingTargets, [], [], VV);
    nnOutputs = sim(foldnet, validation)
	
    predictions = NNout2labels(nnOutputs)
    %predictions = predictions';
	% Calc fold statistics
	foldMatrix = confusionMatrix(orignValidationTargets,predictions)
	[foldRecall,foldPrecision] = recallAndPrecision(foldMatrix)
	foldfmeasure = fMeasure(1,foldRecall,foldPrecision)
	
	confMatrix = confMatrix + foldMatrix;
end
% Calc average statistics
confMatrix
[recall,precision] = recallAndPrecision(confMatrix)
fmeasure = fMeasure(1,recall,precision)
