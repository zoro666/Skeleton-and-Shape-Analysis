%%%%%%%%%%%%% function complexity_lma%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      To compute the entropy of a given object in the pecstrum analysed
%      image
% Input Variables:
%      f      pecstrum of objects
% 
% Returned Results:
%      h        Entropy of the test image respectively
%  
% Processing Flow:
%     1) for all non zero elements in f, calculate corresponding
%     complexities
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

function [ h ] = complexity_lma(f)
h=0;
for i=1:length(f)
    if f(i) ~=0
    
   h = h + (-(f(i))*(log2(f(i)))) ;
    end
end
end

