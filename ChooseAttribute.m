function [best] = chooseAttribute(examples, attributes, targets)
    best = 0;
    for i =1:size(attributes)
        if gain(examples, i, targets) > best
            best = i;
        end
    end   
    
function [x] = infomation(positives, negatives)

    total = positives + negatives;

    x = -positives/total *log2(positives/total) - negatives/total*log2(negatives/total)
    
function [x] = remainder(examples, attributeNum, targets)
    x = 0;
    for value = 0:1
        [positives, negatives] = count(examples, targets, attributeNum, value)
        x = x + (positives + negatives)/length(targets)*information(positives, negatives)
    end
       

function [x] = gain(examples, attributeNum, targets)
    [positives, negatives] = countTotal(targets);
    x = information(positives, negatives) - remainder(examples, attiributeNum, targets)
   
function [positives, negatives] = count(examples, targets, attribColumn, attribValue)
  
    positives = 0;
    negatives = 0;

    [m, n] = size(examples)
    
    for i=1:m
       if examples(i, attribColumn) == attribValue
           if targets(i) == 1
               positives = positives+1;
           else
               negatives = negatives+1;
           end
       end
    end 
    
function [positives, negatives] = countTotal(targets)
    positives = 0;
    negatives = 0;
    for i = 1:length(targets)
        if targets(i) == 1
            positives = positives + 1;
        else
            negatives = negatives + 1;
        end
    end
   