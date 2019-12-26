img = imread('Fig0723(a).tif'); % 128*128 img
haardwt  = @(img,j) haar( haar(double(img),j)',j)';
ihaardwt = @(img,j)uint8(ihaar(ihaar(img,j)',j)');
imgshow = @(A)imshow((A-min(A,[],'all'))/(max(A,[],'all')-min(A,[],'all'))); % just for plot
himg  =  haardwt( img,3);
ihimg = ihaardwt(himg,3);
subplot(1,3,1), imshow(  img)
subplot(1,3,2),imgshow( himg)
subplot(1,3,3), imshow(ihimg)