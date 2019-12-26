function img = addImpulseNoise(img,pepper,salt)
switch nargin
    case 1
        pepper = 0.5; salt = 0.5;
    case 2
        salt = 1 - pepper;
end
if pepper + salt <= 1
    in = rand(size(img));
    img(in < pepper) = 0;
    img(in > 1-salt) = 255;
end