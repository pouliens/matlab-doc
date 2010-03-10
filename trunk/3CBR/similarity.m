function [Sim] = similarity(newcase, oldcase)

% Sim = proportion of shared AUs relative to largest vector
denom = max(length(newcase.problem),length(oldcase.problem));
numer = length(intersect(newcase.problem,oldcase.problem));
Sim = numer / denom;

%{
% Sim = 2*number of AUs in common - number of different AUs
intersection = intersect(newcase.problem,oldcase.problem);
matchingScore = length(intersection)*2;
missing = setdiff(union(newcase.problem,oldcase.problem),intersection);
missingScore = length(missing);
Sim = matchingScore - missingScore;
%}

