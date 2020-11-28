function PQ = P(Q,a,b,c,A0)
%calculates P(Q) exactly as described in the paper with the appropriate
%constants a,b,c,A0
num = a*Q - b*(Q*Q - (1/2)*trace(Q*Q)*eye(2))+ c*trace(Q*Q)*Q;
denom = (a/2)*trace(Q*Q)-(b/3)*trace(Q*Q*Q) + (c/4)*(trace(Q*Q))^2+A0;
denom = sqrt(2*denom);
PQ = num/denom;
end