function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%
% Computes the Euclidean distance matrix.
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
    
    [d,n]=size(X);
    if (d==1)
    S=X.*X;
    D2=S'*ones(1,n)+ones(n,1)*S-2*X'*X;
    D=sqrt(abs(D2));    
    else
    S=X.*X;
    DS = sum(S);
    DST=DS';
    SUM=DST*ones(1,n)+ones(n,1)*DS;
    D2=SUM-2*X'*X;
    D=sqrt(abs(D2));
    end
    D(logical(eye(size(D))))=0;
    
else  % case when there are two inputs (X,Z)
%     [d,n]=size(X); % dimension of X
%     [~,m]=size(Z); % number of input vectors in Z
% 	C=X';
%     B=Z';
%     S=C*X;
%     DS=diag(S);
%     R=B*Z;
%     DR=diag(R);
%     DRT=DR';
%     SUM=DS*ones(1,m)+ones(n,1)*DRT;
%     D2=SUM-2*innerproduct(X,Z);
%     D=sqrt(abs(D2));
    [d,n]=size(X); % dimension of X
    [~,m]=size(Z); % number of input vectors in Z
    if (d==1)
    S=X.*X;
    R=Z.*Z;
    D2=S'*ones(1,m)+ones(n,1)*R-2*X'*Z;
    D=sqrt(abs(D2));    
    else
    S=X.*X;
    DS=sum(S);
    R=Z.*Z;
    DRT=sum(R);
    DST=DS';
    SUM=DST*ones(1,m)+ones(n,1)*DRT;
    D2=SUM-2*X'*Z;
    D=sqrt(abs(D2));
    end


end;
%



