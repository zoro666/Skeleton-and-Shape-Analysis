%%%%%%%%%%%%% function findbounds.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes bounds of object for bounding box
%
% Input Variables:
%      A           Input part of binary image
%      edge        distance of boundary from object(pixel width).
%      lbc,rbc     leftmost and rightmost column of bounding box
%                  respectively
% Returned Results:
%      ubr,lbr     uppermost and lowermost rows of bounding box
%                  respectively
%      lbc,rbc     leftmost and rightmost column of bounding box
%                  respectively
% Processing Flow:
%      1.  First check for rows. In every iteration, check if 1 is 
%          present anywhere in the row. 
%      2.  If present then highlight previous row depending on edge value.
%      3.  Next check for columns. In every iteration, check if 1 is 
%          present anywhere in the column. 
%      2.  If present then highlight previous column depending on edge value.
%
%  Restrictions/Notes:
%      Input image is an object of binary image. Currently, edge is set to
%      1. That is bounding box is formed by leaving 1 pixel around object.
%
%  The following functions are called:
%      None
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        02/20/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ ubr,lbr,lbc,rbc ] = findbounds( A,edge )
br=[];[m,n]=size(A);
for i=1:m 
    if any(A(i,:)) == 1
        br=[br i];
    end
end
ubr=min(br)-edge;       %%upper bound row
lbr=max(br)+edge;       %% lower bound row
bc=[];
for j=1:n 
    if any(A(:,j)) == 1
        bc=[bc j];
    end
end
lbc=min(bc)-edge;       %%left bound column
rbc=max(bc)+edge;       %%right bound column

end

