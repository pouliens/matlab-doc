function [solvedcase] = reuse(Case, newcase)

newcase.solution = Case.solution;
solvedcase = newcase;