%%%%%%%%%%%%%  Function posOfones %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes the position of ones in mask B 
%
% Input Variables:
%     B    generated mask
%      
% Returned Results:
%     p   row value of location of ones
%     q   column value of location of ones
% 
% Processing Flow:
%      1.  Find size of the mask and create two empty array.
%      2.  Check for ones,if present put the row value of the position in 
%          p and column value in q.
% 
%  Restrictions/Notes:
%      This function takes an input of mask and returns the position of
%      zeros in two separate vectors
%
%  The following functions are called:
%      None
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        20/02/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ p,q ] = posOfone( B )

[m1,n1]=size(B);
p=[];q=[];
for i=1:m1
    for j=1:n1
     if B(i,j)==1
     p=[p i]  ;
     q=[q j] ;
     end
    end
end

end

