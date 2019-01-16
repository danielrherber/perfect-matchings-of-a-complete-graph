%--------------------------------------------------------------------------
% PM_index2pm.m
% Finds the perfect matchings of a complete graph for a subset the total
% number available. Therefore, one can find perfect matchings for graphs 
% larger than K20 but complete listings are still impractical.
% This algorithm is much slower in enumerating all the perfect matchings 
% than the recursive one in PM_perfectMatchings.m
%--------------------------------------------------------------------------
% G = PM_index2pm(I,N)
% I : subset of integers between 1 and (N-1)!!
% N : number of vertices (should be even)
% G : matrix of perfect matchings from I grouped in sequential pairs
%--------------------------------------------------------------------------
% Primary Contributor: Daniel R. Herber, Graduate Student, University of 
% Illinois at Urbana-Champaign
% Link: https://github.com/danielrherber/perfect-matchings-of-a-complete-graph
%--------------------------------------------------------------------------
function G = PM_index2pm(I,n)
    % check if the values in I are too large for given N
    if any(I > prod(1:2:n-1))
        error('Error: An entry in I is too large for given N')
    end
    
    % initialize
    n = uint64(n); % change data type
    I = double(I); % change data type
    J = double(1:2:n-1); % odd vertices
    N = uint64(length(I)); % number of perfect matchings to find
    cumDblFac = [1,cumprod(J)]; % cumulative double factorial for N-2
    V = repmat(uint8(1:n),N,1); % create default list of available vertices 
    G = zeros(N,n,'uint8'); % initialize output matrix
    Ir = (1:N); % initialize linear row indices
    
    % add each pair of edges
    for j = J
        q = (n-j+1)/2; % entry in cumDblFac
        idx = ceil(I/cumDblFac(q)); % calculate vertex index
        G(:,j) = V(:,end); % assign largest remaining vertex
        V(:,end) = []; % remove largest remaining vertex
        Ic = sub2ind([N n-1],Ir,idx); % get linear indices (right)
        G(:,j+1) = V(Ic); % assign selected vertex
        V(Ic) = 0; % remove the selected vertex 
        V = sort(V,2); % sort with zeros first
        V(:,1) = []; % remove zeros
        I = I - (idx-1)*cumDblFac(q); % subtract to get index in subgraph
    end
end