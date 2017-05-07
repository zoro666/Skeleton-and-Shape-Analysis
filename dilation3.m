%%%%%%%%%%%%%  Function dilation3.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a dilated image of an original image 
%
% Input Variables:
%      X       mXn input 2D gray-scale image to be filtered
%      B       Structuring element 
% 
% Returned Results:
%     temp     new dilated image
%
% Processing Flow:
%      1.  finding the size of the filter.
%      2.  Place the centre of filter on the image and check whether 1 is 
%          present in any element.
%      3.  If present then return 1(white) at centre pixel else return 0. 
%      
%  Restrictions/Notes:
%      This function takes a binary image as input. The image is not padded 
%       by zeros at the boundary.
%
%  The following functions are called:
%      none
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ temp ] = dilation3( X,B )

g=X;
g2 = zeros(size(g));
s = B;
sof=size(B);
[R,C]=size(g);
k1=round(sof/2);
k2=k1-1;
for r = k1:(R-k2)
    for c = k1:(C-k2)
       A = g(r-k2:r+k2,c-k2:c+k2);
       if any(any(A&s))==1           
           g2(r,c) = 1;
       else
            g2(r,c) = 0;
       end
    end
end
temp= g2;