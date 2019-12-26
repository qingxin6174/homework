img = imread('Fig0308(a).tif');
subplot(1,3,1), imshow(img);
c = 255/log(1+double(max(img(:))));
subplot(1,3,2), imshow(uint8(c*log(1+double(img))));
% min(img)=0, I want log transformation achive the maximized dynamic
% range, which induce c=255/log(1+max(img)).
% the value of c maps 255 to 255 through the log transformation.

r = 0.4; c = 255/double(max(img(:)))^r;
subplot(1,3,3), imshow(uint8(c*double(img).^r));
% the value of c influence the dynamic range, and the value of r influence
% the gray value shifting. Converting low gray value to high gray value
% requires r<1.