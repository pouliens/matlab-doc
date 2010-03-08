function [Case] = retrieve(cbr, newcase)
au_list = newcase.problems;
temp_au_list=au_list; 
cases_list=[];
best_cases=[];

for i=1:length(cbr.clusters)
   matching = intersect(cbr.clusters(i),temp_au_list);
   if (~isempty(matching))
       cases_list = [cases_list cbr.clusters(i).cases];
       temp_au_list = setdiff(temp_au_list,matching);
   end
   if (isempty(temp_au_list)
       break;
   end
end

%Re-establish AUs-list. Examine the cases of cases-list. If the current
%case is composed of AUs that belong to AUs-list, add it to best-cases
for i=1:length(cases_list)
    if(~isempty(intersect(au_list,cases_list(i).problem)))
         best_cases = [best_cases cases_list(i)];
    end
end

% Search best-cases for most similar
similarities = [];
for i=1:length(best_cases)
   similarities = [similarities similarity(newcase,best_cases(i))]; 
end
maxSims = maximumIndices(similarities);
if (length(maxSims) == 1)
   Case = best_cases(maxSims(1));
else
    % Select on typicality
    typicalities = [best_cases.typicality];
    maxTyps = maximumIndices(typicalities);
    if (length(maxTyps) == 1)
       Case = best_cases(maxTyps(1)); 
    else
       % Select randomly? 
    end 
end
