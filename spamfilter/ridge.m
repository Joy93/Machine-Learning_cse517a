function [loss,gradient]=ridge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
   %[d,n]=size(xTr);
   loss=w'*xTr*(xTr)'*w-w'*xTr*(yTr)'-yTr*(xTr)'*w+yTr*(yTr)'+lambda*(w)'*w;
   gradient=2*xTr*(xTr)'*w-2*xTr*(yTr)'+2*lambda*w;
%
