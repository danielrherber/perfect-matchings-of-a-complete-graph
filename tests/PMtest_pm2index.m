%--------------------------------------------------------------------------
% PM_pm2index.m
% test function for PM_pm2index
%--------------------------------------------------------------------------
%
%--------------------------------------------------------------------------
% Primary Contributor: Daniel R. Herber, Graduate Student, University of 
% Illinois at Urbana-Champaign
% Link: https://github.com/danielrherber/perfect-matchings-of-a-complete-graph
%--------------------------------------------------------------------------
close all; clear; clc

% test number (see below)
testnum = 2;

switch testnum
    case 1 % only the first few PMs
        N = 16; % number of vertices
        G = PM_index2pm(1:5,N);
    case 2 % all PMs
        N = 16; % number of vertices
        Nm = prod(1:2:N-1);
        G = PM_index2pm(1:Nm,N);
end

% run and time
tic
I = PM_pm2index(G);
toc