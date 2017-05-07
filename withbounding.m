%%%%%%%%%%%%% function withbounding %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      returns output image with bounded objects
% Input Variables:
%      A        object of the matched label
%      edge     edge=1 the gap b/w object and boundary
%
% Returned Results:
%
%       B        output image with matched object being bounded
%       C        individual object from A with specific bound
%       area     computes area of whole region inside bounding box
% 
% Processing Flow:
%      1. Find the bounds of the labeled object.
%      2. For the specified bounds, highlight the boundary around the
%      object which is done by truning on the pixels on the boundaries.
%      3. Compute the area of region inside the boundary.
%      4. If number of arguments is 1 return image with bounded objects, if
%      arguments are 2 then individual objects as well.
%
%  Restrictions/Notes:
%      None
%
%  The following functions are called:
%      findbounds.m  Computes the bounds depending on the object
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        02/20/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

function [ B,C,area ] = withbounding( A,edge )
[m,n]=size(A);
B=[];
for i=1:m
    for j=1:n
        B(i,j)=A(i,j);
    end
end
[ ubr,lbr,lbc,rbc ] = findbounds( A,edge );
C=[];
for i= ubr:lbr
    for j= lbc : rbc
        C(i,j)=A(i,j);
    end
end
for k=lbc:rbc
   B(ubr,k)=1; 
end
for k=lbc:rbc
   B(lbr,k)=1; 
end
for k=ubr:lbr
   B(k,lbc)=1; 
end
for k=ubr:lbr
   B(k,rbc)=1; 
end
col=rbc-lbc;
row=lbr-ubr;
area=col*row;
if nargout ==1
   B=B; 
end
if nargout ==2
   B=B; 
   C=C;
end
end

