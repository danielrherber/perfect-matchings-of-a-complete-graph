%--------------------------------------------------------------------------
% PerfectMatchings.m
% Use a recursive algorithm to generate a list of all the perfect matchings
% of a complete graph
%--------------------------------------------------------------------------
% G = PerfectMatchings(N,varargin)
% N           : number of vertices (should be even)
% varargin{1} : if present, should be a structure of perfect matchings
% G           : matrix of perfect matchings grouped in sequential pairs
%--------------------------------------------------------------------------
% NOTE: purpose of this function is only to maintain compatibility with a
% previous function name
%--------------------------------------------------------------------------
% Primary Contributor: Daniel R. Herber, Graduate Student, University of 
% Illinois at Urbana-Champaign
% Link: https://github.com/danielrherber/perfect-matchings-of-a-complete-graph
%--------------------------------------------------------------------------
function G = PerfectMatchings(N,varargin)

    % call new function
    G = PM_perfectMatchings(N,varargin{:});

end