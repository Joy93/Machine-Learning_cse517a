function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
% function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
%
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% ktype : (linear, rbf, polynomial)
% Cs   : interval of regularization constant that should be tried out
% paras: interval of kernel parameters that should be tried out
% 
% Output:
% bestC: best performing constant C
% bestP: best performing kernel parameter
% bestval: best performing validation error
% allvalerrs: a matrix where allvalerrs(i,j) is the validation error with parameters Cs(i) and paras(j)
%
% Trains an SVM classifier for all possible parameter settings in Cs and paras and identifies the best setting on a
% validation split. 
%

%%% Feel free to delete this
%bestC=0;
%bestP=0;
%bestval=1e-2;
lCs=length(Cs);
lpa=length(paras);
%% Split off validation data set
% 
indices=crossvalind('Kfold',length(xTr),10);
%% Evaluate all parameter settings
% YOUR CODE
allvalerrs=zeros(lCs,lpa);
for ind=1:9;
    for i=1:lCs;   
       for j=1:lpa;
        [svmclassify,~,~]=trainsvm(xTr(:,indices==ind),yTr(indices==ind), Cs(i),ktype,paras(j));
        allvalerrs(i,j)=allvalerrs(i,j)+sum(sign(svmclassify(xTr(:,indices==10)))~=yTr(indices==10)')./length(yTr(indices==10));
       end
    end
end
%% Identify best setting
% YOUR CODE
bestval=min(min(allvalerrs));
[indx,indy]=find(allvalerrs==bestval);
a=length(indx);    
bestC=Cs(indx(a));
bestP=paras(indy(a));




