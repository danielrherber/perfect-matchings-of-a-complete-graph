%--------------------------------------------------------------------------
% PMtest_index2pm.m
% test function for PM_index2pm
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
    case 1 % first few PMs for N
        N = 16;
        I = 1:15;
    case 2 % all PMs for N
        N = 16;
        I = 1:prod(1:2:N-1);
    case 3 % random matchings for large N
        N = 30; Nrand = 20;
        I = randi([1 prod(1:2:N-1)],1,Nrand);
end

% run and time
tic
G = PM_index2pm(I,N);
toc