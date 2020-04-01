function [fList,pList] = findep(mfile)
%% Dependences
[fList,pList] = matlab.codetools.requiredFilesAndProducts(mfile);
fList=fList';
pList=pList';
% no dependences