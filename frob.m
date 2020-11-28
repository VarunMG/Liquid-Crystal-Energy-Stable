function innprod = frob(A,B)
%calculates the Frobenius inner product
size1 = size(A);
size2 = size(B);
%checking dimension compatibility to take the product
if size1(1) ~= size2(1)
    error('not good size for inner product');
end
if size1(2) ~= size2(2)
    error('not good size for inner product');
end
innprod = (A(:)')*B(:); %this is quite fast
end