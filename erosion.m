%%%%%%%%%%%%%  Function erosion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a eroded image of an original image 
%
% Input Variables:
%      s       mXn input 2D gray-scale image to be filtered
%      sof     size of filter
% 
% Returned Results:
%     temp     new eroded image
%
% Processing Flow:
%      1.  finding the size of the filter,if unspecified then use 3X3.
%      2.  Place the centre of filter on the image and count the number of   
%       ones in that particular structure.
%      3.  If the number of ones is greater than 0 of filter then return 1
%       (white) at the centre else return 0(black).
% 
%  Restrictions/Notes:
%      This function takes a binary as input. The image is not padded 
%       by zeros at the boundary.
%
%  The following functions are called:
%      none
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ temp ] = erosion( X,B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes h
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
g=X;
 
g2 = false(size(g));
s = B;
sof=size(B);
[R,C]=size(g);
k1=round(sof/2);
k2=k1-1;
for r = k1:(R-k2)
    for c = k1:(C-k2)
       A = g(r-k2:r+k2,c-k2:c+k2);
       if (all((A & s) == s) == true)           
           g2(r,c) = true;
       else
            g2(r,c) = false;
       end
    end
end
temp= g2;