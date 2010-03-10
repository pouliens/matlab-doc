%uses jaccard simmilarity coefficient

function [Sim] = similarity(newcase, oldcase, index)

% {
%denom = max(length(newcase.problem),length(oldcase.problem));
intersecting = intersect(newcase.problem, oldcase.problem);
numer = length(intersecting);
denom = length(intersecting) + length(removeItems(newcase.problem, intersecting)) + length(removeItems(oldcase.problem, intersecting));
Sim = numer / denom;
%}

% deprecated code here 
%{
% Sim = proportion of shared AUs relative to largest vector
denom = max(length(newcase.problem),length(oldcase.problem));
numer = length(intersect(newcase.problem,oldcase.problem));
Sim = numer / denom;
%}


%{
% Sim = 2*number of AUs in common - number of different AUs
intersection = intersect(newcase.problem,oldcase.problem);
matchingScore = length(intersection)*2;
missing = setdiff(union(newcase.problem,oldcase.problem),intersection);
missingScore = length(missing);
Sim = matchingScore - missingScore;
%}


% Sim = typicality*number of AUs in common - (typicality*number of different AUs not in
% cluster's index) + number of different AUs in clusters index - all
% normalised by a max score
maxScore = (oldcase.typicality+1)*max(length(newcase.problem),length(oldcase.problem));
intersection = intersect(newcase.problem,oldcase.problem);
matchingScore = length(intersection)*(oldcase.typicality+1);
missing = setdiff(union(newcase.problem,oldcase.problem),intersection);
missingScore = length(missing)*(oldcase.typicality+1);
missButInIndex = intersect(missing,index);
missingButInIndexScore = length(missButInIndex);
Sim = (matchingScore - missingScore + missingButInIndexScore)/maxScore;


end


function [vector] = removeItems(fromVector, itemsToRemove)
fromVector(ismember(fromVector, itemsToRemove)) = [];
vector = fromVector;
end
