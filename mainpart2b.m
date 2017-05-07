%%%%%%%%%%%%% mainpart2b.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To match solid objects from shadow1.gif image properly to the 
%       objects of shadow1rotated.gif
% 
% Input Variables:
%      Xr       input 2D reference image
%      Xt       input 2D test image
%       C       weight vector for pecstral analysis
%     edge      distance of boundary from image(pixel distance)
% 
% Returned Results:
%      hs1,hs2     Entropy of reference and test image respectively
%      fs1,fs2     Pecstrum of reference and test image respectively
%      ms_ar1,ms_ar2  area of objects in reference and test image respectively
%      sszd1,sszd2      size distribution of reference and test image respectively
%      B1,B2     Bounded reference and test image respectively
%      L         Labeled test image
%      ft        pecstrum of spade of reference image
%       R       matched label of objects from test image
%       M        array that displays matches of the labels
%       label1,label2     consists of label number.
%
% Processing Flow:
%      1.  Load, convert input image to binary reference image and display it.
%      2.  Perform analysis to compute entropy,size distribution and
%      pecstrum. 
%      3.  Load, convert input image to binary test image and display it.
%      4.  Perform analysis to compute entropy,size distribution and
%      pecstrum. 
%      5.  Find labeled image separately of test image using connected components
%      function.
%      6.  Choose solid objects of reference image to perform pattern recognition. 
%      7.  Perform pecstral analysis.
%      8.  Display and plot output.
%
%  Restrictions/Notes:
%      This function requires binary image as input. 'shadow1.gif' is
%      used as reference image and 'shadow1rotated.gif' as test image. 
%      This code returns ouput matching labels of the object of the test 
%      image. The labels are evaluated by taking trials of each label after
%      using connected component function. By using weight vectors, objects 
%      with labels 1,3,9 of reference image gets perfectly matched with the 
%      objects of test image. However, object with label 6 is not properly
%      matched.
%
%  Warning : Might take few minutes for the whole code to run depending
%  upon the system configuration
%
%  The following functions are called:
%      analysis_lma.m       returns image with bounding box around object,
%                           pecstrum,size distribution,entropy,area of
%                           objects
%      bwlabel.m    returns labeled image accordint to the connected
%                   component
%      pecstral_analysis.m  performs pecstral analysis as discussed in 
%                           class  
% 
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        02/20/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
clc;close all;clear;

%% computing for reference image
Xr=imread('shadow1.gif');
Xr= double (Xr);
disp('labels of solid objects in shadow1.gif are(from left to right) :')
label1=[1 3 6 9];
disp(label1)
disp('analysing properties of object in match1.gif ..')
[ hs1,fs1,ms_ar1,sszd1,B1] = analysis_lma( Xr );
%% computing for test image
Xt=imread('shadow1rotated.gif');
Xt= double (Xt);
disp('labels of solid objects in shadow1.gif are(from left to right) :')
label2=[2 3 6 8];
disp(label2)
disp('analysing properties of object in match3.gif ..')
[ hs2,fs2,ms_ar2,sszd2,B2] = analysis_lma( Xt );
L = bwlabel(Xt);edge=1;
%% choosing solid objects from reference image
% solid objects in test are label 1,3,6,9 in order and  
% in reference are label 2,3,6,8 in order
disp('choosing solid objets from reference image..')
ft=[fs1(1,:);fs1(3,:);fs1(6,:);fs1(9,:)];       %% rows correspond to particular 
%% testing
disp('performing pattern recognition using pecstral analysis..')
% Create weight vector for finding appropriate object from test image. This
% is chosen by trial and error method computed manually. 
C = [0.0262 0.0220 0.0377 0.0502 0.1444 0.3431 0 0.3556 0 0 0 0];
[ R ] = pecstral_analysis(ft,fs2,C);
%% displaying output
disp('matched label number of match3.gif image is =');disp(R)  
M=[1;3;6;9];
M=[M R];
disp('The matching of objects as per the label numbers is =');
disp('shadow1-->shadow1rotate');disp(M);
%% plotting
figure,imshow(Xr);title('shadow1.gif (reference)image, labels 1,3,6,9')
figure,imshow(Xt);title('shadow1rotated.gif (test)image, labels 2,3,6,8')
disp('code completed!')
toc