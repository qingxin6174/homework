subplot(1,3,1), imshow(imread('Fig0220(a).tif'));
BilinearInterp('Fig0220(a).tif','Fig0220(a)-shrink-to-100dpi.tif',100);
% shrink to 100 dpi.
subplot(1,3,2), imshow(imread('Fig0220(a)-shrink-to-100dpi.tif'))
BilinearInterp('Fig0220(a)-shrink-to-100dpi.tif','Fig0220(a)-zoom-back-to-1250dpi.tif',1250);
% zoom back to 1250 dpi.
subplot(1,3,3), imshow(imread('Fig0220(a)-zoom-back-to-1250dpi.tif'))

function BilinearInterp(imginput,imgoutput,dpi)
img = imread(imginput); [M,N] = size(img);
imginfo = imfinfo(imginput);
ResolPC = dpi / imginfo.XResolution; % dpi to resolution percentage
img = [img,img(:,end)]; img = double([img;img(end,:)]); % add edge
m = floor(ResolPC*M); n = floor(ResolPC*N); % new image resolution
[x,y] = ndgrid(linspace(1,M,m), linspace(1,N,n)); % relative coordinates
intx = floor(x(:)); inty = floor(y(:)); % the integer part of the relative coordinates
fracx = x(:) - intx; fracy = y(:) - inty; % the fractional part of the relative coordinates
img = uint8(reshape( ... % vectorized bilinear interpolation kernel map
    img(intx   + (M+1)*(inty-1)) .* (1-fracx) .* (1-fracy) + ...
    img(intx   + (M+1)* inty   ) .* (1-fracx) .*    fracy  + ...
    img(intx+1 + (M+1)*(inty-1)) .*    fracx  .* (1-fracy) + ...
    img(intx+1 + (M+1)* inty   ) .*    fracx  .*    fracy  , ...
    m,n)); % reshape into new resolution
imwrite(img,imgoutput, 'Resolution',dpi);
end