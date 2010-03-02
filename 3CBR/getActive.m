function a = getActive(example)
a=[]
m = length(example);
for i=1:m
    b= example(i);
    if b==1
        a = horzcat(a,i);
        
    end
end