Lx = 1; %[0,Lx] x [0,Lx]
%constants for bulk energy
a = -0.2; 
b = 1;
c = 1;
A0 = 500;
%dissipation parameter/constant for one-constant approximation
M = 1;
L = 0.001;
Tend = 1; %end time
bd = 'D'; %boundary condition 'D' for Dirichlet, 'N' for Neumann
n = 50; %number of spatial grid points in each direction
m = 100; %number of time steps
[xVals,yVals,tVals,Q1,Q2,q,dt] = new_scheme3(Lx,n, a,b,c,A0,M,L,Tend,m,bd); %solver based on scheme
[newDirector1x, newDirector1y,F] = visualize(Q1,Q2,n,m,xVals,yVals,q,dt); %visualizer animates director field
E = energy(Q1,Q2,q,n,m,Lx,L,A0); %calculates energy 
%%energy plotting
figure;
plot(tVals,E);
title('Energy v. Time');
xlabel('Time')
ylabel('Energy')