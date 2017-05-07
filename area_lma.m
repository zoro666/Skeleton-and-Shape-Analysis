%%%%%%%%%%%%% function area_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      calculates area of object in bounding box
%
% Input Variables:
%      Y           Input binary image
%      ubr,lbr     upper and lower row of bounding box respectively
%      lbc,rbc     leftmost and rightmost column of bounding box
%                  respectively
% Returned Results:
%      ar         area of object 
% Processing Flow:
%      1.  Compute number of ones in the bounding box.
%
%  Restrictions/Notes:
%      Input image is a binary image.Bounds are obtained from previous
%      called function called findbounds.m
%
%  The following functions are called:
%      None
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        02/20/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ ar ] = area_lma(ubr,lbr,lbc,rbc,Y);
ar=0;
for i= ubr:lbr
for j= lbc:rbc
   if Y(i,j)==1
     ar=ar+1;  
    end
end
end

end

