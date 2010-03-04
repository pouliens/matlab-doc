function [Case] = retrieve(cbr, newcase)
au_list = newcase.problems;
list = getListByLabel(cbr,newcase.solutions);
clusters=[];
cases_list=[];
best_cases=[];
solutions=[];

[m,n] = size(au_list);
