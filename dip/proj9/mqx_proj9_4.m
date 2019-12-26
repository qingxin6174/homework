img = imread('FigP0936(bubbles_on_black_background).tif');
img = img(8:781,8:452); % cut rim
stats = regionprops('table',bwconncomp(img,4),'Centroid','Area'); % 4-connected component
centers = stats.Centroid; areas = stats.Area; % get Centroid and Area

AreaBreak = [400,800]; e = 11; [m,n] = size(img);
idx0 =                          areas < AreaBreak(1);
idxa = (centers(:,1)<e | centers(:,1)>n-e | ...
    centers(:,2)<e | centers(:,2)>m-e) & idx0;       % index of problem a
idxb = areas >= AreaBreak(1) & areas < AreaBreak(2); % index of problem b
idxc = idx0 & ~idxa;                                 % index of problem c
idxd = areas >= AreaBreak(2); % index of conjoined particles

imgd = bwselect(img,centers(idxd,1),centers(idxd,2),4); % conjoined particles, white
imga = bwselect(img,centers(idxa,1),centers(idxa,2),4); % problem a, red
imgb = bwselect(img,centers(idxb,1),centers(idxb,2),4); % problem b, green
imgc = bwselect(img,centers(idxc,1),centers(idxc,2),4); % problem c, yellow
subplot(1,3,1),imshow(imga); subplot(1,3,2),imshow(imgb); subplot(1,3,3),imshow(imgc);
figure, subplot(1,2,1),imshow(img);
subplot(1,2,2),imshow(double(cat(3, imga|imgc|imgd, imgb|imgc|imgd, imgd)))