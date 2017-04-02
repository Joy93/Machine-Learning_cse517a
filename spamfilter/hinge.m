function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
[d,n]=size(xTr);
% loss=w'*w;
% gradient=2*w;
% for i=1:n
%     if 1-yTr(i)*w'*xTr(:,i)>0
%     loss=loss+1-yTr(i)*w'*xTr(:,i);
%     gradient=gradient-yTr(i)*xTr(:,i);
%     end
% end
factor1=w'*xTr;
factor=1-yTr'*factor1;
loss=trace(max(factor,0))+lambda*(w)'*w;
% factor2=diag(yTr)*(diag(factor)>0);
factor2 = yTr' .* (diag(factor)>0);
gradient=-xTr*factor2+2*lambda*w;



%


