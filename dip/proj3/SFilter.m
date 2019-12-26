function simg = SFilter(img,kernel)
[x,y] = ndgrid(1:3,1:3); % start index of sampling
simg = zeros(size(img));
img = double([img(:,1),img,img(:,end)]); img = [img(1,:);img;img(end,:)];
% extend img with single-pixel width
for idx = 1:9
    simg = simg + double(kernel(idx)) * ...
        img(x(idx):end-3+x(idx),y(idx):end-3+y(idx));
    % Different sampling of the image is regarded as different layers, 
    % and the filter kernel is expanded as the weight of each layer.
end