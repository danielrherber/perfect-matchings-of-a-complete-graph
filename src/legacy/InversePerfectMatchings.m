%--------------------------------------------------------------------------
% InversePerfectMatchings.m
% Given a matrix representing perfect matching (PM) edge sets, return the 
% corresponding PM numbers in the enumerated list
%--------------------------------------------------------------------------
% I = InversePerfectMatchings(G)
% G : a N x n matrix where each row represents a PM
%       - G must have an even number of rows n
%       - Every integer between 1:n must be present in each row of G
%       - Even row indices are left vertices in edge sets
%       - Odd row indices are right vertices in edge sets
%       - Even row indices are in a decreasing order with respect to the 
%          even element subset
% I : a N x 1 vector with corresponding perfect matching numbers in the 
%      enumerated list
%--------------------------------------------------------------------------
% NOTE: purpose of this function is only to maintain compatibility with a
% previous function name
%--------------------------------------------------------------------------
% Primary Contributor: Daniel R. Herber, Graduate Student, University of 
% Illinois at Urbana-Champaign
% Link: https://github.com/danielrherber/perfect-matchings-of-a-complete-graph
%--------------------------------------------------------------------------
function I = InversePerfectMatchings(G,varargin)

    % call new function
    I = PM_pm2num(G);

end