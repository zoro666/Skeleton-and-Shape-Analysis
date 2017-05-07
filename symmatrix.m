%%%%%%%%%%%%%  Function symmatrix %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Generate a symmatric matrix of the same size
%
% Input Variables:
%      A       Given matrix
% 
% Returned Results:
%     B      Symmatric matrix of A
%
% Processing Flow:
%      1.  Compute the size of A, Create a similar matrix B of Zeros 
%      2.  Go through A in the reverse order and place it in B 
% 
%  Restrictions/Notes:
%     none
%
%  The following functions are called:
%      none
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        20/02/2017
function [ B ] = symmatrix( A )

[m,n]=size(A);

B=zeros(m,n);
for i=1:m
    for j=1:n
        B((m-i+1),(n-j+1))=A(i,j);
    end
end


end

