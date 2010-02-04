function [tree] =DecisionTreeLearning(examples,attribs,targets)

%DECISIONTREELEARNING - creates tree structure based on given examples and targets
%
%IN: examples: sparse binary featureset of aus
%	 attribs: list of considered aus
%	 targets: binary targets associated with examples
%OUT: constructed tree
if sameClass(targets)
    tree.op = [];
    tree.kids = [];
    tree.class = targets(1);
    return
end
if isempty(find(attribs));
    tree.op = [];
    tree.kids = [];
    tree.class = majorityValue(targets);
    return
end
best = ChooseAttribute(examples,attribs,targets);
tree.op = best;
exampleLeft = [];
exampleRight = [];
targetsLeft = [];
targetsRight = [];
left = [];
right = [];
[x,y] = size(examples);
for i = 1:x
    if(examples(i,best) == 1)
		exampleLeft = [exampleLeft;examples(i,:)];
		targetsLeft = vertcat(targetsLeft,targets(i));
	else 
		exampleRight = [exampleRight;examples(i,:)];
		targetsRight = vertcat(targetsRight,targets(i));
    end
end
% attribs = attribs - {best}
attribs(best) = 0;
if isempty(exampleLeft)
	left.op = [];
	left.kids = [];
	left.class = majorityValue(targets);
else
	left = DecisionTreeLearning(exampleLeft,attribs,targetsLeft);
end
if isempty(exampleRight)
	right.op = [];
	right.kids = [];
	right.class = majorityValue(targets);
else 
	right = DecisionTreeLearning(exampleRight,attribs,targetsRight);
end
tree.kids = {left,right};

function [result] = sameClass(targets)
val = targets(1);
result = 1;
for i = 2:length(targets)
    if targets(i) ~= val
    result = 0;
    return
    end
end

function x = majorityValue(y)
x = mode(y);

