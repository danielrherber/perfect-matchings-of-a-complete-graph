%--------------------------------------------------------------------------
% Verify_PerfectMatchings.m
% Finds the perfect matchings matrix and displays some checks on the result
% Random perfect matchings for larger complete graphs
%--------------------------------------------------------------------------
% Author: Daniel R. Herber, Graduate Student, University of Illinois at
% Urbana-Champaign
% Date: 07/27/2015
%--------------------------------------------------------------------------
%% Set size of the complete graph Kn
% This needs to be even
% (and between 2 and 20 unless you have more than 210 Gb of RAM)
N = 14;

%% Find the perfect matchings matrix
% And display first 15 rows
A = PerfectMatchings(N);
disp('First rows of A:')
disp(A(1:min([size(A,1) 15]),:))

%% Some checks on the accuracy of the output
% these should all be the same
disp('Predicted number of perfect matchings (N!!):')
disp(int2str(prod(1:2:N-1)))
disp('Length(A):')
disp(int2str(size(A,1)))
disp('Number of unique rows:')
[~,IA,IC] = unique(A,'rows'); % check if all the rows are unique
disp(int2str(length(IC)))
disp(' ')

% these should all be the same
disp('Predicted row sum:')
disp(int2str(sum(1:N)))
disp('Minimum row sum:')
disp(int2str(min(sum(A,2))))
disp('Maximum row sum:')
disp(int2str(max(sum(A,2))))
disp(' ')

% save the perfect matchings matrix (optional)
% save(['P',num2str(N),'.mat'],'A','-v7.3')

%% Demonstrate the equivalence with the SinglePerfectMatchings approach
Asingle = SinglePerfectMatchings(1:min([size(A,1) 15]),N);
disp('First rows of A with SinglePerfectMatchings:')
disp(Asingle)

%% Demonstrate InversePerfectMatchings
II = zeros(size(Asingle,2),1);
for i = 1:size(Asingle,2)
    II(i) = InversePerfectMatchings(Asingle(i,:));
end
disp('InversePerfectMatchings returns the # given the PM graph:')
disp('PM #s for previous graphs:')
disp(II)

%% Random perfect matchings for larger complete graphs
% 20 random matchings with N = 30
Nsingle = 30; Nrand = 20;
I = randi([1 prod(1:2:Nsingle-1)],1,Nrand);
Arand = SinglePerfectMatchings(I,Nsingle);
disp(Arand)

%%
% 
% <<Image.PNG>>
% 