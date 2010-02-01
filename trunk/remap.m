function x = remap(emotion,y)
x = [];

for i=1:length(y)
    
   if y(i)==emotion
      x=vertcat(x,1);
   else
        x=vertcat(x,0);
   end
end
