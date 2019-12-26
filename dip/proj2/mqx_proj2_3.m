img = imread('Fig0220(a).tif');
subplot(1,3,1), imshow(img);
n = 10; % sampling interval n
simg = img(1:n:end,1:n:end); % shrinking, subsample by interval n
% simg = shrinking(img,n); % shrinking, subsample using mean method
subplot(1,3,2), imshow(simg);
zimg = repelem(simg,n,n); % zooming, repeat each element into a n-by-n block of a new matrix.
subplot(1,3,3), imshow(zimg);
% zoom/shrink factor is n=10, resolution changed,
% subsampling lost information and zooming by pixel replication
% do NOT increase information, resulting in blurred zimg.

function simg = shrinking(img,n) % this is the mean method
[x,y] = size(img); s = floor([x,y]/n);
img = img(1:s(1)*n,1:s(2)*n); simg = zeros(s); %resize img, and set the size of simg.
for idx = 1:n^2
    simg = simg + double(img(rem(idx-1,n)+1:n:end,floor((idx-1)/n)+1:n:end));
    % using mean method in each block to get the subsampling image.
end
simg = uint8(simg/n^2); % calculate mean value.
end