img = imread('Fig0507(a).tif');
subplot(1,3,1),imshow(img);
psimg = addImpulseNoise(img,0.2,0.2);
subplot(1,3,2),imshow(psimg);
mimg = medianFilter3(psimg);
subplot(1,3,3),imshow(mimg);
% pa = pb = 0.1 in fig 5.10(b), salt and pepper noise ratio are lower.
% pa = pb = 0.2 means noise have a greater probability of dominating the
% filter window, and median filter will fail in noise-dominating cases.

function mimg = medianFilter3(img) % Modified by Project 03-03
[x,y] = ndgrid(1:3,1:3); % start index of sampling
mimg = zeros([size(img),9]);
img = double([img(:,1),img,img(:,end)]); img = [img(1,:);img;img(end,:)];
% extend img with single-pixel width
for idx = 1:9
    mimg(:,:,idx) = img(x(idx):end-3+x(idx),y(idx):end-3+y(idx));
end
mimg = uint8(median(mimg,3));
end