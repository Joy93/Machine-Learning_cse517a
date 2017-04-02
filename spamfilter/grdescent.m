function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
w=w0;
flag = 0;
i = 0;
gradient = 0;
thre=1e+10;

if nargin<5,
     tolerance=1e-2;
end;

% fprintf gradient;
while flag == 0,
%     i = i+1;
%    fprintf('i=%d,norm=%f\n',i,norm(gradient));
    [loss,gradient] = func(w);
    if loss < thre
        stepsize=1.01*stepsize;

    else
        stepsize=0.5*stepsize;
    end
   
        w=w-stepsize*gradient;
        thre=loss;
   
   if norm(gradient)<tolerance,
          flag = 1;
   end;
%     if norm(gradient) < 1 && stepflag_1 == 0,
%         stepsize = stepsize / 10;
%         stepflag_1 = 1;
%     end;
%     if norm(gradient) < 0.1 && stepflag_2 == 0,
%         stepsize = stepsize / 10;
%         stepflag_2 = 1;
%     end;
end


