function [y] = testANN(N,x)
%TESTANN, N = trained network, x is input data
% Output a vector of label predictions given data and network

t = sim(N,x);
% May need to format return from sim?
y = t;

