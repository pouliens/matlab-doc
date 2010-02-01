function [tree] DecisionTreeLearning(examples,attribs,targets)

%DECISIONTREELEARNING - creates tree structure based on given examples and targets
%
%IN: examples: sparse binary featureset of aus
%	 attribs: list of considered aus
%	 targets: binary targets associated with examples
%OUT: constructed tree
if sameClass(targets)
    tree.op = []
    tree.kids = []
    tree.class = targets(1)
    return
end
if isempty(find(attribs))
    tree.op = []
    tree.kids = []
    tree.class = majorityValue(targets)
    return
end
best = chooseAttribute(attribs,examples,targets)
tree.op = best
exampleLeft = []
exampleRight = []
targetsLeft = []
targetsRight = []
left = []
right = []
for i = 1:length(examples)
    if(examples(i,best) == 1)
		exampleLeft = [exampleLeft;examples(i,:)]
		targetsLeft = vertcat(targetsLeft,targets(i))
	else 
		exampleRight = [exampleRight;examples(i,:)]
		targetsRight = vertcat(targetsRight,targets(i))
	end
end
% attribs = attribs - {best}
attribs(best) = 0
if isempty(exampleLeft)
	left.op = []
	left.kids = []
	left.class = majorityValue(targets)
else
	left = DecisionTreeLearning(examplesLeft,attribs,targetsLeft)
end
if isempty(exampleRight)
	right.op = []
	right.kids = []
	right.class = majorityValue(targets)
else 
	right = DecisionTreeLearning(examplesRight,attribs,targetsRight)
end
tree.kids = {left,right}

function [result] sameClass(targets)
val = targets(1)
for i = 2:length(targets)
    if targets(i) ~= val
    result = 0
    return
end
result = 1
