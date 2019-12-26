img = imread('Fig0110(4)(WashingtonDC Band4).TIF');
subplot(1,2,1),imshow(img);
rgb = uint8([255,255,0]); % the value of RGB to replace
grayRange = uint8([0,35]); % gray levels to be replaced
for layer = 1:3
    rgblayer = img;
    rgblayer(rgblayer >= grayRange(1) & rgblayer <= grayRange(2)) = rgb(layer);
    rgbimg(:,:,layer) = rgblayer;
end
subplot(1,2,2),imshow(rgbimg);