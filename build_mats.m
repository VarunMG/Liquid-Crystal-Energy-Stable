function [T1,T2,R,B1,B2,F1,F2] = build_mats(p1,p2,M,L,dt,h,n,bd)
%assuming a uniform grid here
%p1 - vector with the p^{1,n} components
%p2 - vector with the p^{2,n} components
%M - the constant M
%L - the constant L
%dt - temporal spacing
%h - the spatial grid spacing
%n - the number of spatial points per dimension
%A - the block matrix of dimensions 2n^2 x 2n^2
if strcmp(bd,'N')
    Lap = disc_laplace_neumann(n);
end
if strcmp(bd,'D')
    Lap = disc_laplace_dirichlet(n);
end
A1 = speye(n^2)*(1/dt);
A2 = ((M*L)/(2*h*h))*Lap;
A3diag = p1.*p1;
A4diag = p2.*p2;
Rdiag = p1.*p2;
A3 = M*spdiags(A3diag(:),0,n^2,n^2);
A4 = M*spdiags(A4diag(:),0,n^2,n^2);
R = M*spdiags(Rdiag(:),0,n^2,n^2);
B1 = M*spdiags(p1(:),0,n^2,n^2);
B2 = M*spdiags(p2(:),0,n^2,n^2);
% A3 = sparse(M*(diag(p1.*p1))); 
% A4 = sparse(M*(diag(p2.*p2)));
% R = sparse(M*diag(p1.*p2));
% B1 = sparse(M*diag(p1));
% B2 = sparse(M*diag(p2));
sqrt(frob(A3,A3));
sqrt(frob(A4,A4));
T1 = A1-A2+A4;
T2 = A1-A2+A3;
F1 = A1+A2+A3;
F2 = A1+A2+A4;
end