function [ trees ] = getAllTrees( )
% Return decision trees for all emotions...

trees = []
for i=1:6
    trees = horzcat(trees, getDecisionTree(i));
end

end

