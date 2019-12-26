function trans = haar(array,j)
[m,n] = size(array);
temp = reshape(array,2,m/2,n);
array = shiftdim(sum(temp,1)/sqrt(2),1);
if j > 1
    trans = [haar(array,j-1);shiftdim(-1/sqrt(2)*diff(temp,1,1),1)];
else
    trans = [array;shiftdim(-1/sqrt(2)*diff(temp,1,1),1)];
end
end