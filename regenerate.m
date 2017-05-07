%%%%%%%%%%%%%  Function regenerate %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Regenerate an Object from the skeleton of object 
%
% Input Variables:
%      S5,S4,S3,S2,S1    Skeletal points
%      B       Structuring Element
% 
% Returned Results:
%     X4b       Regenerated Object
%
% Processing Flow:
%      1.  Dilate the Nth skeletal set of points with B
%      2.  Add it to the (N-1)th skeletal set of points
%      3.  Repeat steps 1,2 until the 1st set of skeletal points is
%      reached.
% 
%  Restrictions/Notes:
%      This function takes a binary as input. The image is not padded 
%       by zeros at the boundary.
%
%  The following functions are called:
%      dilation
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        20/02/2017

function [ Xb ] = regenerate(n, S, B )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
k=2;
Pb{1,1}=zeros(size(S{1}));
for c= (k+1):n
    for p=1:n-k
        S{c}= dilation(S{c},B);
    end
    Pb{1,1}= Pb{1,1}|S{c};
end
 
for d=1:k
   Pb{1,1}= dilation(Pb{1,1},B);
end
Xb{1,1}=Pb{1,1};
    
% A{n}= dilation(S{n},B);
% Xb{1}=S{n-1}+A{n};
% for i=n-1:2
%     for p=2:n-1
%        A{i} =dilation(Xb{p-1},B); 
%        Xb{p}=A{i}+S{i-1};
%     end
% end

    
% A4= dilation(Xb,B);
% X2b=A4+S3;
% A3= dilation(X2b,B);
% X3b= A3+S2;
% A2= dilation(X3b,B);
% X4b= A2+S1;



