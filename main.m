Lx = 1;
a = -0.2;
b = 1;
c = 1;
A0 = 500;
M = 1;
L = 0.001;
Tend = 1;
bd = 'D';
n = 50;
m = 100;
[xVals,yVals,tVals,Q1,Q2,q] = new_scheme3(Lx,n, a,b,c,A0,M,L,Tend,m,bd);
[newDirector1x, newDirector1y,F] = visualize(Q1,Q2,n,m,xVals,yVals,q);