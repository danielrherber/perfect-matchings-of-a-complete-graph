%--------------------------------------------------------------------------
% PM_perfectMatchings.m
% test function for PM_perfectMatchings
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
    case 1
        N = 8; % number of vertices
    case 2
        N = 16; % number of vertices
    case 3
        N = 20; % number of vertices
end

% run and time
tic
G = PM_perfectMatchings(N);
toc