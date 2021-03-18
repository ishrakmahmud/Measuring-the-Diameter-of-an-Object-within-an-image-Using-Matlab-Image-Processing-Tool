close all
clear all
clc
%%
obj=imread('ball4.jpg');
figure(1)
imshow(obj)
imtool(obj)


%%
imgred=obj(:,:,1)
imggreen=obj(:,:,2)
imgblue=obj(:,:,3)

%%
figure(2)
subplot(2,2,1) 
imshow(obj) 
title('Original Color Plane')
figure(2)
subplot(2,2,2) 
imshow(imgred) 
title('Red Color Plane') 
figure(2)
subplot(2,2,3) 
imshow(imggreen) 
title('Green Color Plane')
figure(2)
subplot(2,2,4) 
imshow(imgblue) 
title('Blue Color Plane')


%% 
figure(3)
level=0.4
imbwblue=im2bw(imgblue,level)
imbwred=im2bw(imgred,level)
imbwgreen=im2bw(imggreen,level)
imgsum=(imgblue&imgred&imggreen)
imshow(imbwblue)

%%
imgcomp=imcomplement(imbwgreen)
imgfilled=imfill(imbwblue,'holes')
figure, imshow(imgfilled)

%%
imclear=imclearborder(imgfilled)
%imshow(imclear)
se=strel('disk',35)
open=imopen(imgfilled,se)
imshow(open)
%%
diameter=regionprops(open,'MajorAxisLength')
figure(4)
imshow(obj)
d=imdistline



