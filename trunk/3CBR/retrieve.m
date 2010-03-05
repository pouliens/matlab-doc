function [Case] = retrieve(cbr, newcase)
au_list = newcase.problems;
temp_au_list=au_list; 
clusters=[];
cases_list=[];
best_cases=[];
solutions=[];

index=1;
while ~isempty(temp_au_list)
    a = tem
    clusters = [clusters emolab2str(b)]
    cases_list = [cases_list   ]
    
    
end

%Re-establish AUs-list. Examine the cases of cases-list. If the current
%case is composed of AUs that belong to AUs-list, add it to best-cases
temp_au_list=au_list;
for i=1:length(cases_list)
    if(isempty(setdiff(temp_au_list,cases_list(i).problem)))
         best_cases = [best_cases cases_list(i)];
    end
   
end

temp_case = buildCase([],-1);
for i=1:length(best_cases)
    a = length(best_cases(i).problem);
    b = length (temp_case.problem);
   if(a>b)
       temp_case = best_cases(i);
   end
    
end


[m,n] = size(au_list);
