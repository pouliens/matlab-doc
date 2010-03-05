function [result] = buildIndexes(cbr);
% im sure there's a much better way of doing this


      for i =1:length(cbr.anger_list.cases)
          Case= cbr.anger_list.cases(i);
          if(characterize(cbr.anger_list.cases,Case.problem)==1)
             
           cbr.anger_list.index = union (cbr.anger_list.index, Case.problem);
          end
      end
      
       for i =1:length(cbr.disgust_list.cases)
          Case= cbr.disgust_list.cases(i);
          if(characterize(cbr.disgust_list.cases,Case.problem)==1)
             
           cbr.disgust_list.index = union (cbr.disgust_list.index, Case.problem);
          end
       end
       
       for i =1:length(cbr.fear_list.cases)
          Case= cbr.fear_list.cases(i);
          if(characterize(cbr.fear_list.cases,Case.problem)==1)
             
           cbr.fear_list.index = union (cbr.fear_list.index, Case.problem);
          end
       end
       
       for i =1:length(cbr.happy_list.cases)
          Case= cbr.happy_list.cases(i);
          if(characterize(cbr.happy_list.cases,Case.problem)==1)
             
          cbr.happy_list.index = union (cbr.happy_list.index, Case.problem);
          end
       end
       
       for i =1:length(cbr.sad_list.cases)
          Case= cbr.sad_list.cases(i);
          if(characterize(cbr.sad_list.cases,Case.problem)==1)
             
           cbr.sad_list.index = union (cbr.sad_list.index, Case.problem);
          end
       end
       
       for i =1:length(cbr.surprise_list.cases)
          Case= cbr.surprise_list.cases(i);
          if(characterize(cbr.surprise_list.cases,Case.problem)==1)
             
           cbr.surprise_listindex = union (cbr.surprise_list.index, Case.problem);
          end
       end
      

       result = cbr;
     
   
    function bool = characterize(cases,problem)
        counter=0;
        for j=1:length(cases)
       
        c = setdiff(problem,cases(j).problem);   
        if(isempty(c))
            counter= counter+1;
        end
        end
        if counter>1
           bool=1; 
        else
            bool=0;
        end
        end
end
    