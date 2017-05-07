%%%%%%%%%%%%% mainpart2a.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      To compute size distribution,pecstrum,complexity of images and also  
%       match spade of match1.gif image properly from spade of match3.gif
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
%      ht        entropy of spade of reference image
%      ft        pecstrum of spade of reference image
%      mt        area of spade of reference image
%      sdt       size distribution of spade of reference image
%       label1,label2 consists of label number
%       ri       matched label
%       A        object of the matched label
%       B3       image of jst the bounded object
%       B        output image with matched object being bounded
%       mi1,mi2 returns minimum value and indices of entropy in image
%       ma1,ma2 returns maximum value and indices of entropy in image
% 
% Processing Flow:
%      1.  Load, convert input image to binary reference image and display it.
%      2.  Perform analysis to compute entropy,size distribution and
%      pecstrum. Find least and most complex object.
%      3.  Load, convert input image to binary test image and display it.
%      4.  Perform analysis to compute entropy,size distribution and
%      pecstrum. Find least and most complex object.
%      5.  Find labeled image separately of test image using connected components
%      function.
%      6.  Choose spade of reference image to perform pattern recognition. 
%      7.  Perform pecstral analysis.
%      8.  Display and plot output.
%
%  Restrictions/Notes:
%      This function requires binary image as input. 'match1.gif' is
%      used as reference image and 'match3.gif' as test image. 
%      This code returns ouput according to the spade as the reference 
%      object of 'match1.gif' image. label 4 is spade for match1 image and
%      label 3 for match3 image. Notice the order of objects in the images
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
%      ObjOfImage.m         finds object from image according to the
%                           specified label
%      withbounding.m       returns output image with bounded objects
%         min.m             returns minimum value in array
%         max.m             returns maximum value in array
% 
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        02/20/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
clc;close all;clear;

%% computing for reference image
Xr=imread('match1.gif');
Xr= double (Xr);
disp('objects in match1.gif are :')
disp('flower steer plane spade');
disp('Their corresponding labels are:')
label1=[1 2 3 4];
disp(label1)
disp('analysing properties of object in match1.gif ..')
[ hs1,fs1,ms_ar1,sszd1,B1] = analysis_lma( Xr );
disp(' for labels 1,2,3,4 of image match1.gif analysis is :')
disp('Size distribution(rows corresponds to labels)');disp(sszd1)
disp('pecstrum(rows corresponds to labels)');disp(fs1)
disp('Entropy(rows corresponds to labels)');disp(hs1)
[o1,mi1]=min(hs1);
disp('least complex object corresponds to minimum entropy')
disp('label with minimum entropy is :');disp(mi1)
[o1,ma1]=max(hs1);
disp('most complex object corresponds to maximum entropy')
disp('label with maximum entropy is :');disp(ma1)
figure(1);
subplot(2,2,1)
plot(sszd1(1,:));title('size distribution of flower')
subplot(2,2,2)
plot(sszd1(2,:));title('size distribution of steer')
subplot(2,2,3)
plot(sszd1(3,:));title('size distribution of plane')
subplot(2,2,4)
plot(sszd1(4,:));title('size distribution of spade')
figure(2)
subplot(2,2,1)
plot(fs1(1,:),'*');title('pecstrum of flower')
subplot(2,2,2)
plot(fs1(2,:),'*');title('pecstrum of steer')
subplot(2,2,3)
plot(fs1(3,:),'*');title('pecstrum of plane')
subplot(2,2,4)
plot(fs1(4,:),'*');title('pecstrum of spade')
%% computing for test image
Xt=imread('match3.gif');
Xt= double (Xt);
disp('objects in match3.gif are :')
disp('flower   steer   spade   plane');
disp('Their corresponding labels are:')
label2=[1 2 3 4];
disp(label2)
disp('analysing properties of object in match3.gif ..')
[ hs2,fs2,ms_ar2,sszd2,B2] = analysis_lma( Xt );
L = bwlabel(Xt);edge=1;

disp(' for labels 1,2,3,4 of image match3.gif analysis is :')
disp('Size distribution(rows corresponds to labels)');disp(sszd2)
disp('pecstrum(rows corresponds to labels)');disp(fs2)
disp('Entropy(rows corresponds to labels)');disp(hs2)
[o1,mi2]=min(hs2);
disp('least complex object corresponds to minimum entropy')
disp('label with minimum entropy is :');disp(mi2)
[o1,ma2]=max(hs2);
disp('most complex object corresponds to maximum entropy')
disp('label with maximum entropy is :');disp(ma2)
figure(3)
subplot(2,2,1)
plot(sszd2(1,:));title('size distribution of flower')
subplot(2,2,2)
plot(sszd2(2,:));title('size distribution of steer')
subplot(2,2,3)
plot(sszd2(3,:));title('size distribution of spade')
subplot(2,2,4)
plot(sszd2(4,:));title('size distribution of plane')
figure(4)
subplot(2,2,1)
plot(fs2(1,:),'*');title('pecstrum of flower')
subplot(2,2,2)
plot(fs2(2,:),'*');title('pecstrum of steer')
subplot(2,2,3)
plot(fs2(3,:),'*');title('pecstrum of spade')
subplot(2,2,4)
plot(fs2(4,:),'*');title('pecstrum of plane')
%% choosing spade as reference object
% for choosing spade label is 4 viz. the last row of all
% hs2,fs2,ms_ar2,sszd2
disp('choosing spade (label 4 of match1.gif) as reference object..')
ht=hs1(end,:);              %%entropy of test spade label
ft=fs1(end,:);              %%pecstrum of test spade label
mt=ms_ar1(end,:);           %%main area of test spade label
sdt=sszd1(end,:);           %%size distribution of test spade label
%% testing
disp('performing pattern recognition using pecstral analysis..')
% Create weight vector for finding appropriate object from test image. This
% is chosen by trial and error method. 
C = [1 1 1 1 1 1 0 0 0 0 0 0];         
[ ri ] = pecstral_analysis(ft,fs2,C);
%% displaying output
A = ObjOfImage( L,Xt,ri );
B3 = withbounding( A,edge );
B = Xt + B3; 
disp('matched label number of match3.gif image is =');disp(ri)  
%% plotting
figure,imshow(Xr);title('reference image')
figure,imshow(B);title('matched object is in bounding box')
disp('code completed!')
toc