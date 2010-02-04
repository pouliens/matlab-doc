function RunDecisionTreeLearning(targetNum)

[examples, targets] = loaddata('cleandata_students.txt');

attributes = getAUArray();

targets = remap(targetNum, targets);

tree = DecisionTreeLearning(examples, attributes, targets)

DrawDecisionTree(tree,emolab2str(targetNum))
