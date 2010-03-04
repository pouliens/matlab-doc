function [result] = storeCase(cbr,Case)

%append case the relevant case list
switch Case.solution
    case 1
       
      cbr.anger_list.cases= [cbr.anger_list.cases Case];
    case 2
       
       cbr.disgust_list.cases = [cbr.disgust_list.cases Case];
    case 3
         
         cbr.fear_list.cases = [cbr.fear_list.cases Case];
    case 4
         
        cbr.happy_list.cases = [cbr.happy_list.cases Case];
    case 5
         
        cbr.sad_list.cases =[cbr.sad_list.cases Case];
    case 6
        
        cbr.suprise_list.cases = [cbr.suprise_list.cases Case];
    otherwise
        error('Unknown emotion label');
end
result = cbr;
end