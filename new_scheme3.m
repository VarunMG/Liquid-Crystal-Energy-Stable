function [xVals,yVals,tVals,Q1,Q2,q] = new_scheme3(Lx,n, a,b,c,A0,M,L,Tend,m,bd)
%Lx size of the square so domain is [0,Lx] x [0,Lx]
%number of spatial steps per dimension (so grid size is n^2)
%a,b,c,A0 - for the P(Q) function
%M,L - constants 
%Tend - the end time 
%m - the number of time steps
%bd is boundary conditions. bd = 'N' for neuman and 'D' for dirichlet
tic;
tVals = linspace(0,Tend,m);
dt = tVals(2)-tVals(1);
xVals = linspace(0,Lx,n+2);
yVals = linspace(0,Lx,n+2);
h = xVals(2)-xVals(1);
%initializing values
[Q1,Q2,p1,p2,q] = initialize_values(xVals,yVals,m,n,a,b,c,A0); %obtain initial values
%step 1 is the same as the initial values
Q1(:,2) = Q1(:,1);
Q2(:,2) = Q2(:,1);
p1(:,2) = p1(:,1);
p2(:,2) = p2(:,1);
q(:,2) = q(:,1);
for time = 3:m
    %following the scheme as in the notes
    p1(:,time) = 1.5*p1(:,time-1)-0.5*p1(:,time-2);
    p2(:,time) = 1.5*p2(:,time-1)-0.5*p2(:,time-2);
    %building matrices 
    [T1,T2,R,B1,B2,F1,F2]  = build_mats(p1(:,time),p2(:,time),M,L,dt,h,n,bd);
    %building RHS for system Ax = g
    g1 = F1*Q1(:,time-1)+R*Q2(:,time-1)-B1*q(:,time-1);
    g2 = F2*Q2(:,time-1)+R*Q1(:,time-1)-B2*q(:,time-1);
    A = [T1 R;R T2];
    G = [g1;g2];
    %solving the system
    new = A\G;
    q1new = new(1:n^2);
    q2new = new(n^2+1:end);
    %updating new Q values
    Q1(:,time) = q1new;
    Q2(:,time) = q2new;
    %updating q
    q(:,time) = q(:,time-1) + (2/M)*B1*(q1new-Q1(:,time-1))+(2/M)*B2*(q2new-Q2(:,time-1));
    index = 1;
    %going through spatial grid and updating the P(Q) entries
    for i=2:n+1
        for j=2:n+1
            entry1 = Q1(index,time);
            entry2 = Q2(index,time);
            Q = [entry1,entry2;entry2,-1*entry1];
            Pnew = P(Q,a,b,c,A0);
            p1(index,time) = Pnew(1,1);
            p2(index,time) = Pnew(1,2);
            index = index+1;
        end
    end
end
toc;
end