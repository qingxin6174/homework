img = imread('Fig0608(RGB-full-color-cube).tif');
subplot(1,2,1),imshow(img);
wsimg = rgb2websafe(img);
subplot(1,2,2),imshow(wsimg);
imwrite(wsimg,'Fig0608(Web-safe-color-cube).tif');
% Color depth reduced from 255 levels (8 bits) to 6 levels, 
% "color ladder" is more pronounced.

function img = rgb2websafe(img)
img = double(img);
img(          img<= 25) = 0;
img(img> 25 & img<= 76) = 51;
img(img> 76 & img<=127) = 102;
img(img>127 & img<=178) = 153;
img(img>178 & img<=229) = 204;
img(img>229           ) = 255;
img = uint8(img);
end