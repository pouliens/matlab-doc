function [best] = ChooseAttribute(examples, attributes, targets)
    best = firstNonZero(attributes);
    highestGain = gain(examples, best, targets);

    for i = best:length(attributes)
        if attributes(i) == 1
            gain = gain(examples, i, targets);
            
            % if gain > highestGain -- seems break code for fear (gives a
            % node with label 0), however, produces much shorter trees
            % where it works... 
            if gain > highestGain
                best = i;
                highestGain = gain;
            end 
        end
    end  
    
function [x] = firstNonZero(attributes)    
    for i =1:length(attributes)
        if attributes(i) == 1
            x = i;
            return
        end
    end
    
function [x] = information(positives, negatives)

    if negatives == 0
        x = 0;
        return
    end
    if positives == 0
        x = 0;
        return
    end
    
    total = positives + negatives;
    x = -(positives/total) *log2(positives/total) - (negatives/total)*log2(negatives/total);
    
function [x] = remainder(examples, attributeNum, targets)
    x = 0;
    for value = 0:1
        [positives, negatives] = count(examples, targets, attributeNum, value);
        x = x + ((positives + negatives)/length(targets))*information(positives, negatives);
    end
       

function [x] = gain(examples, attributeNum, targets)
    [positives, negatives] = countTotal(targets);
    x = information(positives, negatives) - remainder(examples, attributeNum, targets);
   
function [positives, negatives] = count(examples, targets, attribColumn, attribValue)
  
    positives = 0;
    negatives = 0;

    [m, n] = size(examples);
    
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
   
