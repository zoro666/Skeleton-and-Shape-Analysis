%%%%%%%%%%%%% function checknum.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Checks whether number is present in array
%
% Input Variables:
%      X           Input array
%      p           Input number to be checked
%      
% Returned Results:
%      c         	Returns 1/0 for present or absent 
% Processing Flow:
%      1.  Check for the number in each element of array. If match found
%      break loop and return 1 else return 0.
%
%  Restrictions/Notes:
%      None
%
%  The following functions are called:
%      None
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        02/20/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ c ] = checknum(p,X)

l=length(X);
c=0;
for i=1:l
   if X(i) == p
   c=c+1;   %%match found
   break
   end
    end

end

