function [ ttestResultForEachEmotion ] = doTtests( fmeasuresA, fmeasuresB )

ttestResultForEachEmotion = [];
%for each emotion
for i=1:6
    ttestResultForEachEmotion = [ttestResultForEachEmotion , ttest(fmeasuresA(:, i),  fmeasuresB(:, i), 0.05)]; 
end

end

