function img = idft2d(fmg) % idft
[M,N] = size(fmg);
[x,y] = ndgrid(1:M,1:N);
img = exp(-2*pi*1i/M*(0:M-1)'*(0:M-1))/M * fmg * ...
    exp(-2*pi*1i/N*(0:N-1)'*(0:N-1))/N ;
img = uint8(real(img.*(-1).^(x+y)));
end