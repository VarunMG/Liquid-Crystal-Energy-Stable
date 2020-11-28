function L = disc_laplace_dirichlet(n)
%n - number of spatial points per dimension
%L - the discrete finite difference Laplacian matrix of dimension nxn
internalPoints=n;
e   = ones(internalPoints,1);
spe = spdiags([e -2*e e], -1:1,internalPoints,internalPoints);
Iz  = speye(internalPoints);
sp  = kron(Iz,spe)+kron(spe,Iz);
L = sp;
%full(sp)
end