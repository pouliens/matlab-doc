function [cbr] = CBRinit(examples, labels)


[m,n] = size(examples);
%initialises cbr lists. cases organised in clusters i.e vector for each
%emotion category, each emotion vector furthermore has 3 vectors corresponding to 
%label, cases and index
cbr.clusters = []; % clusters ordered to match emo
for i=1:6
    cbr.clusters = [cbr.clusters struct('label',emolab2str(i),'cases',[],'index',[])];
end

for i=1:m
   
   [active] = getActive(examples(i,:));
   [Case] = buildCase(active,labels(i));
   [cbr] = storeCase(cbr,Case);
 
end
%[cbr] = buildIndexes(cbr); - no longer needed


end