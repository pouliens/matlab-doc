function [ ttestResultForEachEmotion ] = doTtests( fmeasuresA, fmeasuresB )

ttestResultForEachEmotion = [];
%for each emotion
for i=1:6
    ttestResultForEachEmotion = [ttestResultForEachEmotion , ttest(fmeasuresA(:, 1),  fmeasuresB(:, 1), 0.05)]; 
end

end

