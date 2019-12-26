img = imread('Fig0441(a).tif');
% highpass filter
M = [10,10]; c = (M+1)/2; sig = 30;
subplot(1,3,1),imshow(uint8(double(img)-SFilter(img,gaussiankernel(sig,c,M))));
M = [20,20]; c = (M+1)/2; sig = 60;
subplot(1,3,2),imshow(uint8(double(img)-SFilter(img,gaussiankernel(sig,c,M))));
M = [40,40]; c = (M+1)/2; sig = 120;
subplot(1,3,3),imshow(uint8(double(img)-SFilter(img,gaussiankernel(sig,c,M))));

function gk = gaussiankernel(sig,C,M)
[x,y] = ndgrid(1:M(1),1:M(2));
gk = exp(-((x-C(1)).^2+(y-C(2)).^2)/2/sig);
gk = gk/sum(gk(:));
end