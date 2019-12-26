% SFilter.m is the answer, This part explains that the difference
% between SFilter and conv2 is the kernel flipped or not.

img = imread('Fig0338(a).tif');
tic,a = conv2(img,[0,-1,0;-1,5,-1;0,-1,0],'same');toc,
tic,b = SFilter(img,[0,-1,0;-1,5,-1;0,-1,0]);toc
% a==b