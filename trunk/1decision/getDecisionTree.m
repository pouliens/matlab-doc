function [ tree ] = getDecisionTree( targetNum )
[examples, targets] = loaddata('cleandata_students.txt');

attributes = getAUArray();

targets = remap(targetNum, targets);
tree = DecisionTreeLearning(examples, attributes, targets);

end

