img = imread('Fig0628(b)(jupiter-Io-closeup).tif');
subplot(1,2,1),imshow(img);
idximg = zeros(size(img(:,:,1)));
img = double(img);
idximg(sqrt(sum(img.*img,3)) < 100) = 1;
subplot(1,2,2),imshow(idximg);