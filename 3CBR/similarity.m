
%uses jaccard simmilarity coefficient

function [Sim] = similarity(newcase, oldcase)
%denom = max(length(newcase.problem),length(oldcase.problem));
intersecting = intersect(newcase.problem, oldcase.problem);
numer = length(intersecting);

denom = length(intersecting) + length(removeItems(newcase.problem, intersecting)) + length(removeItems(oldcase.problem, intersecting));

Sim = numer / denom;
end

function [vector] = removeItems(fromVector, itemsToRemove)
fromVector(ismember(fromVector, itemsToRemove)) = [];
vector = fromVector;
end


%{
% Sim = 2*number of AUs in common - number of different AUs
intersection = intersect(newcase.problem,oldcase.problem);
matchingScore = length(intersection)*2;
missing = setdiff(union(newcase.problem,oldcase.problem),intersection);
missingScore = length(missing);
Sim = matchingScore - missingScore;
%}

