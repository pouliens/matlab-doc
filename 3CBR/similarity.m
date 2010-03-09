function [Sim] = similarity(newcase, oldcase)
denom = max(length(newcase.problem),length(oldcase.problem));
numer = length(intersect(newcase.problem,oldcase.problem));
Sim = numer / denom;