%%%%%%%%%%%%% function pecstral_analysis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      performs pecstral analysis as discussed in class 
%
% Input Variables:
%      ft       pecstrum of test object
%      C        weight vector for finding appropriate object from test image
%      fs1      Pecstrum of reference image
% 
% Returned Results:
%      R        array/number with minimum distance found after pecstral
%               analysis. It also corresponds to the label of the matched
%               object
% 
% Processing Flow:
%      1. Elementwise subtract pecstrum of test object to the pecstrum of
%      reference object which is given as the error distance.
%      2. Square the error distance and multiply by weights.
%      3. Perform for all the objects from reference image.
%      4. Find minimum distance from all such computations for objects
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

function [ R ] = pecstral_analysis(ft,fs1,C)
[r,c]=size(fs1);
[r1,c1]=size(ft);
R=[];
for k=1:r1
d=[];
for i=1:r
    co=0;
for j=1:c
   co= co + (C(j)*(ft(k,j)-fs1(i,j)))^2; 
end
d=[d;(sqrt(co))];
end
[vi,ri]=min(d);
R=[R;ri];
end
end

