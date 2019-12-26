function simg = SFilter(img,kernel)
% proj 03-03, changed a little
[m,n] = size(kernel);
[x,y] = ndgrid(1:m,1:n); % start index of sampling
simg = zeros(size(img));
img = double([img(:,floor(n/2)+mod(n,2)-1:-1:1),img,img(:,end:-1:end-floor(n/2)+1)]);
img = [img(floor(m/2)+mod(m,2)-1:-1:1,:);img;img(end:-1:end-floor(m/2)+1,:)];
% extend img with single-pixel width
parfor idx = 1:m*n % you can change PARFOR loop to FOR loop
    simg = simg + double(kernel(idx)) * img(x(idx):end-m+x(idx),y(idx):end-n+y(idx));
    % Different sampling of the image is regarded as different layers,
    % and the filter kernel is expanded as the weight of each layer.
end