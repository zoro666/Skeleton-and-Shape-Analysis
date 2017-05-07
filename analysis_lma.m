%%%%%%%%%%%%% function analysis_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      returns image with bounding box around object,
%      pecstrum,size distribution,entropy,area of objects
% Input Variables:
%      X    Input binary image
% 
% Returned Results:
%      hs         Entropy of image 
%      fs         Pecstrum of image
%      ms_ar      area of objects in image
%      sszd       size distribution of image
%      B          Bounded reference of image
% Processing Flow:
%      1.  Compute labels from image by using connected component function.
%      2.  Find bounds of each labeled image and compute area and size
%      distribution of objects.
%      3.  Compute pecstrum using size distribution for every object.
%      4.  Compute entropy of each object using pecstrum 
%      5.  Return the image with bounding boxes on each labeled object
%
%  Restrictions/Notes:
%      Used connected component function of Matlab for labeling.
%
%  The following functions are called:
%      pecstrum_lma.m   computes pecstrum of object      
%      bwlabel.m       returns labeled image accordint to the connected component 
%      ObjOfImage.m     finds object from image according to the specified label
%      withbounding.m   returns output image with bounded objects
%      findlabels.m     returns labels found in image in array
%      findbounds.m    finds bounds of a particular label for bounding box
%      area_lma.m        computes area of image in bounding box
%      complexity_lma.m   returns entropy of object
%      dilation3.m        performs dilation on image
%      erosion.m          performs erosion on image
%      symmatrix.m        returns symmetric matrix of structuring element
%
% 
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        02/20/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ hs,fs,ms_ar,sszd,B] = analysis_lma( X )
%% labeling
L = bwlabel(X);
edge=1;
[m,n]=size(L);
labelarray = findlabels( L );
itr=length(labelarray);
B=zeros(m,n);
hs=[];fs=[];ms_ar=[];sszd=[];
%% compute bounds, size distribution and pecstrum
for label=1:itr

A = ObjOfImage( L,X,label );
[ ubr,lbr,lbc,rbc ] = findbounds( A,edge );
m_ar=area_lma(ubr,lbr,lbc,rbc,A);

ms_ar=[ms_ar; m_ar];

szd=[];

for r=1:12;           %% r = 1 to 12
rB= ones((3+(2*(r-1))));  
rBS=symmatrix(rB);      %% symmetric B for erosion
Y= dilation3((erosion(A,rBS)),rB);
ar=area_lma(ubr,lbr,lbc,rbc,Y);
szd=[szd ar];
end

sszd = [sszd ; szd];

f = pecstrum_lma( szd,m_ar);
fs = [fs ; f];

f1=[];
for i = 1 :length(f)
   if f(i) ~= 0
       f1(i)=f(i);      %% removing zeros from end
   end
end

%% compute complexity
 h = complexity_lma(f1); %% using no zero f
 hs = [hs ; h];
%% bounded box image 
B1 = withbounding( A,edge );
B=B+B1;
end

end

