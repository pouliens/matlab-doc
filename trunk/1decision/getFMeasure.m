function [ fmeasure ] = getFMeasure( targets, outputs )

confusionMat = confusionMatrix(targets, outputs);
[recall, precision] = recallAndPrecision(confusionMat);
fmeasure = fMeasure(1, recall, precision)

end

