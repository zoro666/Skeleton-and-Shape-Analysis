% %%%%%%%%%%%%% function MBR_lma.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Creates minimum bounding rectangle (MBR) around object
%
% Input Variables:
%      B           Input binary image
%      ubr,lbr     uppermost and lowermost rows of bounding box
%                  respectively
%      lbc,rbc     leftmost and rightmost column of bounding box
%                  respectively
% 
% Returned Results:
%      C           Image with MBR  
%
% Processing Flow:
%      1. Using specified bounds turn on the pixels in the image.
%      2. Boundary is designed on the specified bounds.
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

function [ C ] = MBR_lma( ubr,lbr,lbc,rbc,B  )
C=B;
for k=lbc:rbc
   C(ubr,k)=1; 
end
for k=lbc:rbc
   C(lbr,k)=1; 
end
for k=ubr:lbr
   C(k,lbc)=1; 
end
for k=ubr:lbr
   C(k,rbc)=1; 
end

end

