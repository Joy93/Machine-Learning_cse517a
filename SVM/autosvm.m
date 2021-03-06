function svmclassify=autosvm(xTr,yTr)
%	function svmclassify=autosvm(xTr,yTr)
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% 
% Output:
% svmclassify : a classifier (scmclassify(xTe) returns the predictions on xTe)
%
%
% Performs cross validation to train an SVM with optimal hyper-parameters on xTr,yTr
%
disp('Performing cross validation ...');
[bestC,bestP,~,~]=crossvalidate(xTr,yTr,'rbf',1.3.^[-2:8], 1.2.^[-2:5]);
disp('Training SVM ...');
[svmclassify,~,~]=trainsvm(xTr,yTr,bestC,'rbf',bestP);

