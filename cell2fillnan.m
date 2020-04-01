function matnanfilled=cell2fillnan(celldata)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% matnanfilled=cell2fillnan(celldata)
% The CTD reference database data (pres,temp,sal and ptmp) is organized 
% in a matrix which profiles are stored in columns. The length of the
% profiles is variable (number of samples). Therefore the number of rows of
% the matrices is given by the profile with the larger number of samples.
% Columns with shorter profiles are therefore filled with nans to match the
% number of rows of the longest profile.
% This function merges matrices with different number of rows, provided in
% a row-vector cell array, into a big numerical matrix.

% INPUT
% * cell_data is a row-vector cell array contatining the matrices to be
%   merged. 
% OUTPUT
% * matnanfilled merged numerical matrix
% 
% Author: Ingrid M. Angel-Benavides
%         BSH - MOCCA/EA-Rise (Euro-Argo)
%        (ingrid.angel@bsh.de)
% Last update: 09.10.2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% number of matrices to be merged
nn = cellfun(@size, celldata,'UniformOutput',0);
% for each matrix
for i=1:numel(celldata)
    % get dimensions
    n(i)=nn{i}(1);
    m(i)=nn{i}(2);
    % gets position indices for the data of this matrix in the big matrix
    if i==1
        ind(i,1)=1;ind(i,2)=m(i);
    else
        ind(i,1)=ind(i-1,2)+1;ind(i,2)=ind(i-1,2)+m(i);
    end
end
% preallocate output
matnanfilled = nan(max(n),sum(m));
for i=1:numel(celldata)
    % fill merged matrix
    matnanfilled(1:n(i),ind(i,1):ind(i,2))=celldata{i};
end