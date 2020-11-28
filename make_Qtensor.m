function Q = make_Qtensor(Q1,Q2,i,j)
%given the vector representing the elements of the Q tensor matrix wher
%with Q(i,j) we have that i represents a spatial component and j is
%temporal
Q = zeros(2,2);
a = Q1(i,j);
b = Q2(i,j);
Q(1,1) = a;
Q(1,2) = b;
Q(2,1) = b;
Q(2,2) = -1*a;
end