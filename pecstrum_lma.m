%%%%%%%%%%%%% function pecstrum_lma.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes pecstrum of the object
%
% Input Variables:
%      szd           Size distribution of the object
%      m_ar          Actual area of the object.
%
% Returned Results:
%      f             Normalized pecstrum of object   
%
% Processing Flow:
%      1.  Subtract previous element of size distribution array from current. 
%      2.  Normalize the array with the area of object.
%
%  Restrictions/Notes:
%      None. 
%
%  The following functions are called:
%      None 
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        02/20/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ f ] = pecstrum_lma( szd,m_ar)
szd1=[szd 0];
f=[];
for i=1:(length(szd1)-1)
f(i)= (-(szd1(i+1)-szd1(i)));
end
f=f/m_ar;

end

