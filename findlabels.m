%%%%%%%%%%%%% function findlabels.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Checks whether labels are present in array
%
% Input Variables:
%      L           Labeled input binary image
%
% Returned Results:
%      labelarray   Returns labels present in the labeled image   
%
% Processing Flow:
%      1.  Create empty labelarray. 
%      2.  Compare labelarray and labeled image.
%      3.  If the label number is present in the label array then keep checking.
%      4.  Else update the labelarray wth new found label number.
%
%  Restrictions/Notes:
%      Input image is labeled image. 
%
%  The following functions are called:
%      checknum.m  Checks if number is present in the array 
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        02/20/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ labelarray ] = findlabels( L )
[m,n]=size(L);
l2=[];
for i=1:m
    for j=1:n
        if checknum(L(i,j),l2)== 0 
        l2 = [l2 L(i,j)];
        end
    end
end
labelarray = l2(2:end);

end

