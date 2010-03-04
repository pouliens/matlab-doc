function [cbr] = CBRinit(examples, labels)


[m,n] = size(examples);
%initialises cbr lists. cases organised in clusters i.e vector for each
%emotion category, each emotion vector furthermore has 3 vectors corresponding to 
%label, cases and index

cbr.anger_list = struct('label','anger','cases',[],'index',[]);
cbr.suprise_list =struct('label','surprise','cases',[],'index',[]);
cbr.fear_list =struct('label','fear','cases',[],'index',[]);
cbr.sad_list =struct('label','sadness','cases',[],'index',[]);
cbr.happy_list =struct('label','happyness','cases',[],'index',[]);
cbr.disgust_list =struct('label','disgust','cases',[],'index',[]);

for i=1:m
   
   [active] = getActive(examples(i,:));
   [Case] = buildCase(active,labels(i));
   [cbr] = storeCase(cbr,Case);
 
end
%[cbr] = buildIndexes(cbr);


end