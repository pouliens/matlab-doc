function [trainedNetwork] = getTrainedNetwork()

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

[x, y] = loaddata('cleandata_students.txt');


[training,validation,trainingTargets,validationTargets] = splitData7525(x,y,1);
    
[training, trainingTargets] = ANNdata(training,trainingTargets);
[validation, validationTargets] = ANNdata(validation, validationTargets);   
    [x, y] = ANNdata(x, y);
   
    VV.P = validation;
    VV.T = validationTargets;    
    trainedNetwork= train(net,training,trainingTargets, [], [], VV);