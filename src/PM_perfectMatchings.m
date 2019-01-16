%--------------------------------------------------------------------------
% PM_perfectMatchings.m
% Use a recursive algorithm to generate a list of all the perfect matchings
% of a complete graph
%--------------------------------------------------------------------------
% G = PM_perfectMatchings(N,varargin)
% N           : number of vertices (should be even)
% varargin{1} : if present, should be a structure of perfect matchings
% G           : matrix of perfect matchings grouped in sequential pairs
%--------------------------------------------------------------------------
% Primary Contributor: Daniel R. Herber, Graduate Student, University of 
% Illinois at Urbana-Champaign
% Link: https://github.com/danielrherber/perfect-matchings-of-a-complete-graph
%--------------------------------------------------------------------------
function G = PM_perfectMatchings(N,varargin)
    % if only 2 vertices
    if N == 2
        G = uint8([2 1]);
        return
    end

    % check if P is present
    if isempty(varargin) 
        P = cell(N,1); % initialize structure
        P{2} = uint8([2 1]); % perfect matchings of K2
    else
        P = varargin{1}; % assign previously found perfect matchings
    end

    % find the list of perfect matchings with the recursive algorithm
    G = SubMatchings(uint8(1:N),P);
end
%--------------------------------------------------------------------------
% G = SubMatchings(V,P)
% V : list of available vertices 
% P : cell array containing previously found perfect matchings
% G : matrix of perfect matchings
%--------------------------------------------------------------------------
function G = SubMatchings(V,P)
    % initialize
    n = length(V); % number of vertices
    N = prod(1:2:n-3); % number of repetitions, (N-3)!!

    % go through each available vertex
    for j = n-1:-1:1
        v = V; % local list of vertices
        L = [repmat(v(n),N,1) repmat(v(j),N,1)]; % repeat this connection        
        v(n) = []; % remove largest remaining value
        v(j) = []; % remove the selected value    
        if isempty(P{n-2}) % does the K_{N-2} perfect matchings matrix exist?
            % find the perfect matchings, recursive
            P{n-2} = SubMatchings(uint8(1:n-2),P);
        end
        R = v(P{n-2}); % sort remaining vertices with previous perfect matchings  
        G(N*(j-1)+1:N*(j),:) = [L,R]; % add to matrix of perfect matchings
    end
end