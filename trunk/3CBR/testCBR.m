function [ predictions ] = testCBR( cbr, dataAUs)
%Test the CBR with matrix of dataAUs and dataTargets
%   builds a new case for each row of dataAUs and the corresponding
%   dataTargets and retrives most similar case from cbr system.
predictions = [];
[m, n] = size(dataAUs);
for i = 1:m
    activeAUs = getActive(dataAUs(i, :));
    newCase = buildCase(activeAUs, 0);
    similarCase = retrieve(cbr, newCase);
    newCase.solution = similarCase.solution;
    %retain(cbr, newCase);
    predictions = [predictions similarCase.solution];
end