function dimg = erosion(img,kernel)
[x,y] = ndgrid(1:3,1:3); % start index of sampling
dimg = zeros(size(img));
img = double([img(:,1),img,img(:,end)]); img = [img(1,:);img;img(end,:)];
% extend img with single-pixel width
for idx = 1:9
    dimg = dimg + kernel(idx) * ...
        img(x(idx):end-3+x(idx),y(idx):end-3+y(idx));
    % just filter
end
dimg(dimg<sum(kernel,'all')-1e-2) = 0;
dimg(dimg>sum(kernel,'all')-1e-1) = 1;