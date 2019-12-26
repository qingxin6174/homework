img = imread('Fig0221(a).tif');
[x,y] = size(img);
level = 6; % output levels in total, you can change this number.
levels = 2.^round(linspace(1,8,level)); % output levels
levels = reshape(repmat(levels,x*y,1),x,y,level);
imgarray = uint8(round(repmat(double(img),1,1,level)./levels).*levels);
for idx = 1:level
    subplot(1,level,idx),imshow(imgarray(:,:,idx));
end