%%%%%%%%%%%%% function symmatrix.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes symmetric matrix
%
% Input Variables:
%      A           Structuring element
%
% Returned Results:
%      B           Output symmetric matrix of A
%
% Processing Flow:
%      1.  Write all the elements of A in B in the manner suh that
%      B=A(-i,-j)as discussed in notes.
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

function [ B ] = symmatrix( A )
[m,n]=size(A);
B=zeros(m,n);
for i=1:m
    for j=1:n
        B((m-i+1),(n-j+1))=A(i,j);
    end
end
end

