function [Q1,Q2,p1,p2,q] = initialize_values(xVals,yVals,m,n,a,b,c,A0)
%xVals - the array with all the x values
%yVals - the array with all the y values
%m - the number of time steps
%n - the number of spatial steps in the x and y directions (n^2 points)
%a,b,c,A0 - the constants in the energy term P(Q)
%representing the Q tensor as Q = [Q1, Q2; Q2, -Q1]
%p1 and p2 are the components for $P^{n+1/2}$ = [p1, p2; p2, -p1]
%q - the scalar term
Q1 = zeros(n^2,m);
Q2 = zeros(n^2,m);
p1 = zeros(n^2,m);
p2 = zeros(n^2,m);
q = zeros(n^2,m);
index = 1; %incremented as we go along 
for i = 2:n+1
    for j = 2:n+1
        n0Vec = n0(xVals(i),yVals(j)); %n0 is a separate function for the initial director
        Q0 = n0Vec*n0Vec.' - (norm(n0Vec)^2/2)*eye(2);
        q(index,1) = sqrt(2*((a/2)*trace(Q0*Q0)-(b/3)*trace(Q0*Q0*Q0)+(c/4)*(trace(Q0*Q0))^2+A0)); %equation 2.16 says this should be initial value for q
        Q1(index,1) = Q0(1,1); %tabulating value for Q1
        Q2(index,1) = Q0(1,2); %tabulating value for Q2
        Pn = P(Q0,a,b,c,A0); %for the initial $P^{n+1/2}$ value we just make it P(Q_0) since there is no Q_{-1}
        p1(index,1) = Pn(1,1); %tabulating value for p1
        p2(index,1) = Pn(1,2); %tabulating value for p2
        index = index+1;
    end
end
end