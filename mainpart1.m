%%%%%%%%%%%%%  Function mainpart1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Solution to the Part-1  of Project-2
%
% Input Variables:
%      X       Binary input image 
%      B1,B2,B3      Structuring Elements
% 
% Returned Results:
%     T1,T2,T3        Skeleton of objects in X using B1,B2,B3 respectively
%     K1,K2,K3        Regenerated objects in X using B1,B2,B3 respectively
%
% Processing Flow:
%      1.  Find the skeleton of object in X using a given structuring element
%      2.  Regenerate the object in X using a given structuring element
%      3.  Repeat steps 1,2 for all structuring elements and input images
% 
%  Restrictions/Notes:
%      This function takes a binary as input. The image is not padded 
%       by zeros at the boundary.
%
%  The following functions are called:
%      skeletonize
%      regenerate
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        20/02/2017
%% main
tic
clc;
close all;
clear;
X=imread('bear.gif');
X= double (X);
%% Masks and symmetric matrix
B1= [1 1 1; 1 1 1; 1 1 1];       %% 3x3 square
B2= [0 1 0; 1 1 1; 0 1 0];       %% rhombus
B3= [0 0 1; 0 1 0; 0 0 0];       %% VEC045


%% finding skeleton
n=20;
[T1,S1]= skeletonize(n,X,B1);
[T2,S2]= skeletonize(n,X,B2);
[T3,S3]= skeletonize(n,X,B3);

%% regenerating

K1= regenerate( n,S1,B1);
K2= regenerate( n,S2,B2);
K3= regenerate(n,S3,B3);
K1=K1{1,1};
K2=K2{1,1};
K3=K3{1,1};
%% plot
figure,imshow(X);
hold on
[m,n]=size(T1);
for k=1:m
    for l=1:n
        if T1(k,l)==1
            plot(l,k, 'r.', 'MarkerSize', 1);
            title('skeleton on original image WITH B1');
        end
    end
end

hold off;
figure,imshow(K1);
title('Regenerated from B1 Skeleton')
figure,imshow(X);
hold on
[m,n]=size(T2);
for k=1:m
    for l=1:n
        if T2(k,l)==1
            plot(l,k, 'r.', 'MarkerSize', 1);
            title('skeleton on original image WITH B2');
        end
    end
end

hold off;
figure,imshow(K2);
title('Regenerated from B2 Skeleton')
figure,imshow(X);
hold on
[m,n]=size(T3);
for k=1:m
    for l=1:n
        if T3(k,l)==1
            plot(l,k, 'r.', 'MarkerSize', 1);
            title('skeleton on original image WITH B3');
        end
    end
end

hold off;
figure,imshow(K3);
title('Regenerated from B3 Skeleton')
figure,imshow(X);
title('Original Image')
toc