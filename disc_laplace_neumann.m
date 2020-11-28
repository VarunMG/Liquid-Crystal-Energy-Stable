function L = disc_laplace_neumann(n)
%builds the 2D discrete Laplacian
skeleton = gallery('tridiag',n,1,0,1);
In = eye(n);
backer = kron(skeleton,In);
e = ones(n,1);   
inner = gallery('tridiag',n,1,-4,1);
inner(1,1) = -3;
inner(n,n) = -3;
In(1,1) = 0;
In(n,n) = 0;
innerCells = kron(In,inner);
B = zeros(n,n);
B(1,1) = 1;
B(n,n) = 1;
corner = gallery('tridiag',n,1,-3,1);
corner(1,1) = -2;
corner(n,n) = -2;
cornerCells = kron(B,corner);
L = innerCells+cornerCells+backer;
end