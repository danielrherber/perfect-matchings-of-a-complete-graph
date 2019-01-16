%--------------------------------------------------------------------------
% PM_verify.m
% Finds the perfect matchings matrix and displays some checks on the result
% Random perfect matchings for larger complete graphs
%--------------------------------------------------------------------------
% Primary Contributor: Daniel R. Herber, Graduate Student, University of 
% Illinois at Urbana-Champaign
% Link: https://github.com/danielrherber/perfect-matchings-of-a-complete-graph
%--------------------------------------------------------------------------
%% Set size of the complete graph Kn
% This number needs to be even
% (and between 2 and 20 unless you have more than 210 Gb of RAM)
N = 14;

%% Find the perfect matchings matrix
% and display first 15 rows
G = PM_perfectMatchings(N);
disp('PM_perfectMatchings returns all PMs for a given N')
disp('first rows of G:')
disp(G(1:min([size(G,1) 15]),:))
disp(' ')

%% Some checks on the accuracy of the output
% these should all be the same
disp('predicted number of perfect matchings (N-1)!!:')
disp(int2str(prod(1:2:N-1)))
disp('length(G):')
disp(int2str(size(G,1)))
disp('number of unique rows:')
[~,IA,IC] = unique(G,'rows'); % check if all the rows are unique
disp(int2str(length(IC)))
disp(' ')

% these should all be the same
disp('predicted row sum:')
disp(int2str(sum(1:N)))
disp('minimum row sum:')
disp(int2str(min(sum(G,2))))
disp('maximum row sum:')
disp(int2str(max(sum(G,2))))
disp(' ')

% save the perfect matchings matrix (optional)
% save(['P',num2str(N),'.mat'],'G','-v7.3')

%% Demonstrate the equivalence with the PM_index2pm approach
G = PM_index2pm(1:min([size(G,1) 15]),N);
disp('first rows of G with PM_index2pm:')
disp(G)
disp(' ')

%% Demonstrate PM_pm2index
I = zeros(1,size(G,1));
for i = 1:size(G,1)
    I(i) = PM_pm2index(G(i,:));
end
disp('PM_pm2index returns the # given the PM graph')
disp('PM #s for previous graphs:')
disp(I)
disp(' ')

%% Random perfect matchings for larger complete graphs
% 20 random matchings with N = 30
Nsingle = 30; Nrand = 20;
I = randi([1 prod(1:2:Nsingle-1)],1,Nrand);
Grand = PM_index2pm(I,Nsingle);
disp('PM_index2pm returns the PM graph given the #')
disp(Grand)
disp(' ')

%%
% 
% <<image.png>>
%