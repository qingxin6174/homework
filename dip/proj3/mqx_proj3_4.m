img = imread('Fig0338(a).tif');
subplot(1,5,1), imshow(img);
subplot(1,5,2), imshow(1./(1+exp(-1*SFilter(img,[0,1,0;1,-4,1;0,1,0]))));
subplot(1,5,3), imshow(1./(1+exp(-1*SFilter(img,[1,1,1;1,-8,1;1,1,1]))));
subplot(1,5,4), imshow(uint8(SFilter(img,[0,-1,0;-1,5,-1;0,-1,0])));
subplot(1,5,5), imshow(uint8(SFilter(img,[-1,-1,-1;-1,9,-1;-1,-1,-1])));
% In order to show the image operated by Laplace operator, (including
% positive and negative values), the transformation 1/(1+exp(-x)) is adopted.

% since kernel is up-down and left-right symmetrical, you can replace
% SFilter to conv2 without changing results.

% subplot(1,5,1), imshow(img);
% subplot(1,5,2), imshow(1./(1+exp(-1*conv2(img,[0,1,0;1,-4,1;0,1,0],'same'))));
% subplot(1,5,3), imshow(1./(1+exp(-1*conv2(img,[1,1,1;1,-8,1;1,1,1],'same'))));
% subplot(1,5,4), imshow(uint8(conv2(img,[0,-1,0;-1,5,-1;0,-1,0],'same')));
% subplot(1,5,5), imshow(uint8(conv2(img,[-1,-1,-1;-1,9,-1;-1,-1,-1],'same')));