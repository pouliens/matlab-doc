function [ predictions ] = testCBR( cbr, dataAUs, dataTargets )
%Test the CBR with matrix of dataAUs and dataTargets
%   builds a new case for each row of dataAUs and the corresponding
%   dataTargets and retrives most similar case from cbr system.
predictions = [];

for i = 1:length(dataTargets)
    activeAUs = getActive(dataAUs(i, :));
    newCase = buildCase(activeAUs, dataTargets(i));
    similarCase = retrieve(cbr, newCase);
    if (similarCase.solution == newCase.solution)
        cbr = retain(cbr, newCase);
    end
    predictions = [predictions similarCase.solution];
end