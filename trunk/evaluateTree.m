function [ bool ] = evaluateTree(T, attributes )
% T = decisionTree
% Return value evaluated by tree T

if(isempty(T.kids))
    bool = T.class;
    return
else
    if(attributes(T.op) == 1)
        bool = evaluateTree(T.kids{1}, attributes);
        return 
    else
        bool = evaluateTree(T.kids{2}, attributes);
        return 
    end
end


end

