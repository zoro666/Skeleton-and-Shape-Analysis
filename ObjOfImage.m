%%%%%%%%%%%%% function ObjOfImage.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Extracts objects from the image
%
% Input Variables:
%      L           Labeled input binary image
%      X           Input binary image 
%      label       label number of object
%
% Returned Results:
%      A           Extracted object from image corresponding to their label   
%
% Processing Flow:
%      1.  Compare label number to the labeled image. 
%      2.  If comparison is true then return white(1), else return false(0).
%
%  Restrictions/Notes:
%     None. 
%
%  The following functions are called:
%     None 
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        02/20/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ A ] = ObjOfImage( L,X,label )
[m,n]=size(X);
A=zeros(m,n);
for i=1:m
    for j=1:n
    if L(i,j)==label
    A(i,j)=X(i,j);
    end
   end
end

end

