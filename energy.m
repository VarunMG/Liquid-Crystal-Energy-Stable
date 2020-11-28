function E = energy(Q1,Q2,q,n,m,Lx,L,A0)
%the energy is $\int_{\Omega} \frac{L}{2} | \nabla  |^2 + \frac{1}{2}q^2 - A0
%The discrete energy will replace the integral with a sum and multiply by dx
%Q tensor is Q = [Q1, Q2; Q2, -Q1]
%q is the scalar quantity
%n is the spatial size so a total of n^2 grid points 
%m is the number of time steps
E = zeros(m,1);
h = Lx/(n+1);
for i=1:m
    q1 = reshape(Q1(:,i),n,n);
    q2 = reshape(Q2(:,i),n,n);
    qVals = reshape(q(:,i),n,n);
    [gradq1x,gradq1y] = gradient(q1,h);
    [gradq2x,gradq2y] = gradient(q2,h);
    normsqgradq1 = gradq1x.*gradq1x + gradq1y.*gradq1y;
    normsqgradq2 = gradq2x.*gradq2x + gradq2y.*gradq2y;
    normsqgradQ = 2*normsqgradq1 + 2*normsqgradq2;
    E(i) = h^2*(sum(sum((L/2)*normsqgradQ+(1/2)*qVals.*qVals))-A0);
end