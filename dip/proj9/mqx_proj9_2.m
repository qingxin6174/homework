img = imread('Fig0914(a)(licoln from penny).tif');
subplot(2,3,1),imshow(img);title('original')
kernel = [0,1,0;1,1,1;0,1,0];
% kernel = ones(3);
dimg = dilation(img,kernel);
subplot(2,3,2),imshow(dimg);title('dilation')
subplot(2,3,3),imshow(dimg-img);title('dilation-original diff boundary')

eimg = erosion(img,kernel);
subplot(2,3,4),imshow(eimg);title('erosion')
subplot(2,3,5),imshow(img-eimg);title('original-erosion diff boundary')

subplot(2,3,6),imshow(img-eimg);title('dilation-erosion diff boundary')