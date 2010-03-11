function [Case] = retrieve(cbr, newcase)
au_list = newcase.problem;
temp_au_list=au_list;
cases_list=[];
best_cases=[];

%Matching the paper algorithm - not sure whether we want the au removal or not
for i=1:length(cbr.clusters)
   matching = intersect(cbr.clusters(i).index,temp_au_list);
   if (~isempty(matching))
       cases_list = [cases_list cbr.clusters(i).cases];
       %temp_au_list = setdiff(temp_au_list,matching);
   end
   %if (isempty(temp_au_list))
   %    break;
   %end
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
   similar = similarity(newcase,best_cases(i), cbr.clusters(best_cases(i).solution).index);
   similarities = [similarities similar];
end
maxSims = maximum(similarities);
for i = 1:length(maxSims)
    if (similarities(maxSims(i)) == 1)
        Case = best_cases(maxSims(i));
        return;
    end
end

if (length(maxSims) == 1)
   Case = best_cases(maxSims(1));
else
    % Select on typicality (selecting random on tie)
    allTyps = [best_cases.typicality];
	typicalities = [];
    similarityLabels = [];
	for i = 1:length(maxSims)
		typicalities = [typicalities best_cases(maxSims(i)).typicality];
        for j = 1: typicalities(i)
            similarityLabels = [similarityLabels best_cases(maxSims(i)).solution];
        end
    end
    
	%index = randMax(typicalities);
    %Case = best_cases(index);
    modeLabel = randMaxMode(similarityLabels);
    finalCases = [];
    for i = 1:length(maxSims)
        if (best_cases(maxSims(i)).solution == modeLabel)
            finalCases = [finalCases best_cases(maxSims(i))];
        end
    end 	
    Case = finalCases(randInt(1 , length(finalCases)));
end

function [result] = maximum(vals)
maximum = max(vals);
result = [];
for i = 1:length(vals)
	if(abs(vals(i) - maximum) < 0.5)
		result = [result i];
	end
end

function [result] = randMax(vals)
maximum = max(vals);
maximums = [];
for i = 1:length(vals)
	if(vals(i) == maximum)
		maximums = [maximums i];
	end
end
index = randInt(1,length(maximums));
result = maximums(index);

% returns most frequent case labels - selects at random if multiple
function [result] = randMaxMode(caseLabels)
Y = sort(caseLabels); 
N = histc(caseLabels,Y);
Y(N==0) = [];
N(N==0) = [];
result = Y(randMax(N));

function [x] = randInt(m,n)
x = floor((n-m+1)*rand+m);
