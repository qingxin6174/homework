function itrans = ihaar(array,j)
[m,n] = size(array);
ARRAY = shiftdim(array,-1);
array1 = ARRAY(1,1:m/2^j,:);
array2 = ARRAY(1,m/2^j+1:m/2^(j-1),:);
itrans = reshape([array1+array2;array1-array2]/sqrt(2),m/2^(j-1),n);
if j > 1
    array(1:m/2^(j-1),:) = itrans;
    itrans = ihaar(array,j-1);
end
end