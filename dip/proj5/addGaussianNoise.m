function gnimg = addGaussianNoise(img,mu,sigma)
switch nargin
    case 1
        mu = 0; sigma = 1;
    case 2
        sigma = 1;
end
gnimg = uint8(double(img) + mu + sqrt(sigma)*randn(size(img)));