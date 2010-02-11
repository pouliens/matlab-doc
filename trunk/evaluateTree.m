function [ bool, val ] = evaluateTree(T, attributes )
% T = decisionTree
% Return value evaluated by tree T

if(isempty(T.kids))
    bool = T.class;
	val = 1;
    return
else
    if(attributes(T.op) == 1)
        [bool,val] = evaluateTree(T.kids{1}, attributes);
        val = val + 1;
		return 
    else
        [bool,val] = evaluateTree(T.kids{2}, attributes);
        val = val + 1;
		return 
    end
end


end

