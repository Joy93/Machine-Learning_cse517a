function K = computeK(kernel_type, X, Z, param)
% function K = computeK(kernel_type, X, Z)
% computes a matrix K such that Kij=g(x,z);
% for three different function linear, rbf or polynomial.
%
% Input:
% kernel_type: either 'linear','polynomial','rbf'
% X: n input vectors of dimension d (dxn);
% Z: m input vectors of dimension d (dxm);
% param: kernel parameter (inverse kernel width gamma in case of RBF, degree in case of polynomial)
%
% OUTPUT:
% K : nxm kernel matrix
%
%

if nargin<3,
	Z=X;
end;

%%%%%%%Correct dimensions
if strcmp(kernel_type,'linear');
    K=X'*Z;
elseif strcmp(kernel_type,'rbf');
    K=exp(-param*l2distance(X,Z).^2);
elseif strcmp(kernel_type,'poly');
    if ~isinteger(param)
        param=floor(param);
    end
    K=(X'*Z+1).^param;
end

    
    

%%YOUR CODE HERE