function [result] = storeCase(cbr,Case)

%append case the relevant case list & increment typicality if it already
%exists
    caseNum = exists(cbr.clusters(Case.solution).cases, Case.problem);
    if (caseNum == 0)
      cbr.clusters(Case.solution).cases = [cbr.clusters(Case.solution).cases Case];
      cbr.clusters(Case.solution).index = union(cbr.clusters(Case.solution).index, Case.problem);
    else
       cbr.clusters(Case.solution).cases(caseNum).typicality = cbr.clusters(Case.solution).cases(caseNum).typicality + 1;
    end
result = cbr;

function index = exists(cases,problem)

    for j=1:length(cases)
        c = setdiff(problem,cases(j).problem);   
        if  (isempty(c))
            index = j;
            return
        end
    end
index = 0;