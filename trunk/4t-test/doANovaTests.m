function [ pValuesForEachEmotion ] = doANovaTests( fMeasuresA, fmeasuresB, fmeasuresC )

pValuesForEachEmotion = [];

%for each emotion
for i = 1:6
    X = [fMeasuresA(:, i), fmeasuresB(:, i), fmeasuresC(:, i)];
    pValuesForEachEmotion = [pValuesForEachEmotion, anova1(X)];
end


end

