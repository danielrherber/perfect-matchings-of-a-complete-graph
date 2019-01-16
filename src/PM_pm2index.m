%--------------------------------------------------------------------------
% PM_pm2index.m
% Given a matrix representing perfect matching (PM) edge sets, return the 
% corresponding PM numbers in the enumerated list
%--------------------------------------------------------------------------
% I = PM_pm2index(G)
% G : N x n matrix where each row represents a PM
%       - G must have an even number of rows n
%       - Every integer between 1:n must be present in each row of G
%       - Even row indices are left vertices in edge sets
%       - Odd row indices are right vertices in edge sets
%       - Even row indices are in a decreasing order with respect to the 
%          even element subset
% I : N x 1 vector with corresponding perfect matching numbers in the 
%      enumerated list
%--------------------------------------------------------------------------
% Primary Contributor: Daniel R. Herber, Graduate Student, University of 
% Illinois at Urbana-Champaign
% Link: https://github.com/danielrherber/perfect-matchings-of-a-complete-graph
%--------------------------------------------------------------------------
function I = PM_pm2index(G)
    % initialize
    G = uint8(G); % ensure data type
    Gsize = uint64(size(G)); % size of the input matrix
    N = Gsize(1); % find the number of graphs in M
    n = Gsize(2); % total number of vertices
    I = ones(N,1,'uint64'); % initialize output
    Va = repmat(uint8(1:n),N,1); % initialize list of available vertices
    cumDblFac = cumprod(n-3:-2:1,'reverse'); % cumulative double factorial
    Ir = (1:N)'; % initialize linear row indices
    
    % go through each pair of edges
    for k = 1:n/2-1        
        Ic = sub2ind(Gsize,Ir,G(:,(k-1)*2+1)); % get linear indices (left)
        Va(Ic) = 0; % zero entry of left vertex
        Vaz = sort(Va,2); % sort with zeros first
        Vaz(:,1:2*k-1) = []; % remove all zeros
        [~,idx] = max(Vaz==G(:,2*k),[],2); % find index of right vertices
        idx = uint64(idx); % change data type
        Ic = sub2ind(Gsize,Ir,G(:,2*k)); % get linear indices (right)
        Va(Ic) = 0; % zero entry of right vertex
        I = I + (idx-1)*cumDblFac(k); % offset PM number
    end
end