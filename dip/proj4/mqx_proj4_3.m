img = imread('Fig0441(a).tif');
subplot(2,3,1),imshow(img);

% lowpass filter
M = [5,5]; c = (M+1)/2; sig = min(M);
subplot(2,3,2),imshow(uint8(SFilter(img,gaussiankernel(sig,c,M))));
M = [10,10]; c = (M+1)/2; sig = min(M);
subplot(2,3,3),imshow(uint8(SFilter(img,gaussiankernel(sig,c,M))));
M = [20,20]; c = (M+1)/2; sig = min(M);
subplot(2,3,4),imshow(uint8(SFilter(img,gaussiankernel(sig,c,M))));
M = [50,50]; c = (M+1)/2; sig = min(M);
subplot(2,3,5),imshow(uint8(SFilter(img,gaussiankernel(sig,c,M))));
M = [100,100]; c = (M+1)/2; sig = min(M);
subplot(2,3,6),imshow(uint8(SFilter(img,gaussiankernel(sig,c,M))));

function gk = gaussiankernel(sig,C,M)
[x,y] = ndgrid(1:M(1),1:M(2));
gk = exp(-((x-C(1)).^2+(y-C(2)).^2)/2/sig); % gaussian lowpass filter
gk = gk/sum(gk(:));
end