%%%%%%%%%%%%%  Function dilation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a dilated image of an original image 
%
% Input Variables:
%      s       mXn input 2D gray-scale image to be filtered
%      sof     size of filter
% 
% Returned Results:
%     temp     new dilated image
%
% Processing Flow:
%      1.  finding the size of the filter,if unspecified then use 3X3.
%      2.  Place the centre of filter on the image and count the number of   
%       ones in that particular structure.
%      3.  If the number of ones is less than (sof*sof) of filter 
%       then return 0 (black) at the centre else return 1(white).
%      
%  Restrictions/Notes:
%      This function takes a binary image as input. The image is not padded 
%       by zeros at the boundary.
%
%  The following functions are called:
%      checkZeros
%      posOfone
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        20/02/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ temp ] = dilation( X,B )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
g2 = zeros(size(X));

[R,C]= size(X);
sof=size(B);
k1=round(sof/2);
k2=k1-1;


for r=k1:(R-k2)
    for c = k1:(C-k2)
         A = X(r-k2:r+k2,c-k2:c+k2);
        [ p,q ]= posOfone( B );
        [ c0 ] = checkzeros( A,p,q );
        if c0==1
            g2(r,c)=1;
        end
    end
end

temp= g2;

