function [fmeasure] = fMeasure(alpha, recall, precision)
fmeasure =zeros(length(recall), 1);

for i = 1:length(recall)
    fmeasure(i) = ((1+alpha)*precision(i)*recall(i))/(alpha*precision(i) + recall(i));
end