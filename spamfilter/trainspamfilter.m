function trainspamfilter(xTr,yTr);
%function trainspamfilter(xTr,yTr);
% INPUT:	
% xTr
% yTr
%
% NO OUTPUT

[d,n]=size(xTr);

% Feel free to change this code any way you want
f=@(w) ridge(w,xTr,yTr,1);
w0=zeros(size(xTr,1),1); % initialize with all-zeros vector
%load w0.mat;
%w0=w;
w=grdescent(f,w0,1e-2,100,0.001);

save('w0','w');


