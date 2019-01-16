%--------------------------------------------------------------------------
% SinglePerfectMatchings.m
% Finds the perfect matchings of a complete graph for a subset the total
% number available. Therefore, one can find perfect matchings for graphs 
% larger than K20 but complete listings are still impractical.
% This algorithm is much slower in enumerating all the perfect matchings 
% than the recursive one in PM_perfectMatchings.m
%--------------------------------------------------------------------------
% G = SinglePerfectMatchings(I,N)
% I : subset of integers between 1 and (N-1)!!
% N : number of vertices (should be even)
% G : matrix of perfect matchings from I grouped in sequential pairs
%--------------------------------------------------------------------------
% NOTE: purpose of this function is only to maintain compatibility with a
% previous function name
%--------------------------------------------------------------------------
% Primary Contributor: Daniel R. Herber, Graduate Student, University of 
% Illinois at Urbana-Champaign
% Link: https://github.com/danielrherber/perfect-matchings-of-a-complete-graph
%--------------------------------------------------------------------------
function G = SinglePerfectMatchings(I,n)

    % call new function
    G = PM_index2pm(I,n);

end