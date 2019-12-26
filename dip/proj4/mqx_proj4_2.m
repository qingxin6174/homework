img = imread('Fig0441(a).tif');
subplot(1,3,1),imshow(img);
fmg = log(1+abs(dft2d(img)));
subplot(1,3,2),imshow((fmg-min(fmg(:)))/(max(fmg(:))-min(fmg(:))));
subplot(1,3,3),imshow(idft2d(dft2d(img)));
m = max(abs(dft2d(img)),[],'all')/numel(img);
% same as mean2(img)
isequal(m,mean2(img))