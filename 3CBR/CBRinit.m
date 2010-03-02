function [cbr] = CBRinit(examples, labels)
[m,n] = size(examples);
CaseBase=[];
for i=1:m
   x = getActive(examples(i,:));
   [Case] = buildCase(x,labels(i));
    
end