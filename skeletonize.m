%%%%%%%%%%%%%  Function skeletonize %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a skeleton of object present in the original image 
%
% Input Variables:
%      X       mXn input 2D binary image
%      B       Structuring Element
% 
% Returned Results:
%     T        Skeleton of objects in X (union of S5,S4,S3,S2,S1)
%     S5,S4,S3,S2,S1    Skeletal points
%
% Processing Flow:
%      1.  Find the symmatric matrix of the structuring element
%      2.  Erode the original image and open it with B
%      3.  Take result of step2 and erode before opening with B
%      4.  Repeat steps 2,3 until a skeleton is obtained
% 
%  Restrictions/Notes:
%      This function takes a binary as input. The image is not padded 
%       by zeros at the boundary.
%
%  The following functions are called:
%      erosion
%      dilation
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        20/02/2017

function [ T,S ] = skeletonize( n,X,B )

BS=symmatrix(B);

Y{1}= erosion(X,BS);
Yo{1}= dilation((erosion(Y{1},BS)),B);
S{1}=Y{1}-Yo{1};
for i=2:n
Y{i}=erosion(Y{i-1},BS);
Yo{i}= dilation((erosion(Y{i},BS)),B);
S{i}=Y{i}-Yo{i};
end
T= S{1};
for i=2:n
    T= T | S{i};
end



