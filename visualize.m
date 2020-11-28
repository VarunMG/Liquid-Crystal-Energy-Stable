function [newDirector1x, newDirector1y,F] = visualize(Q1,Q2,n,m,xVals,yVals,q,dt)
%visualizes the result
director1x = zeros(n,n,m);
director1y = zeros(n,n,m);
director2x = zeros(n,n,m);
director2y = zeros(n,n,m);
eVals = zeros(n^2,m);
X = zeros(n+2,n+2);
Y = zeros(n+2,n+2);
for i=1:n
    X(i,:) = xVals;
    Y(i,:) = yVals;
end
Y = Y.';
for i=1:m
    for j=1:n^2
        Q = make_Qtensor(Q1,Q2,j,i);
        [V,D] = eig(Q);
        v1 = V(:,1);
        v2 = V(:,2);
        e1 = D(1,1);
        e2 = D(2,2);
        eVals(j,i) = e1;
%         disp('j val:')
%         disp(j)
%         disp('x index:')
%         disp(ceil(j/n))
%         disp('y index:')
%         disp(mod(j-1,n)+1)
%         disp('----')
        ind1 = ceil(j/n);
        ind2 = mod(j-1,n)+1;
%         if ind1==1 && ind2==1
%             disp(j);
%             disp('upper left');
%         end
%         if ind1==n && ind2==n
%             disp(j);
%             disp('lowerright');
%         end
        director1x(ind2,ind1,i) = v1(1);
        director1y(ind2,ind1,i) = v1(2);
        director2x(ind2,ind1,i) = v2(1);
        director2y(ind2,ind1,i) = v2(2);
    end
    %disp('-----');
end
figure
axis off
axis equal
v = VideoWriter('default.avi');
open(v);
F(m) = struct('cdata',[],'colormap',[]);
for i=1:m
    newDirector1x = [zeros(1,n+2); zeros(n,1), director2x(:,:,i), zeros(n,1); zeros(1,n+2)];
    newDirector1y = [zeros(1,n+2); zeros(n,1), director2y(:,:,i), zeros(n,1); zeros(1,n+2)];
%     a = eVals(:,i);
%     a = reshape(a,n,n);
%     zlim([-1,1]);
%     surf(a);
    q = quiver(X,Y,newDirector1x,newDirector1y);
    q.ShowArrowHead = 'off';
    F(i) = getframe;
    writeVideo(v,F(i));
    pause(0.1)
end
close(v);
%%plotting at specific time intervals
important = [1,floor(m/6),  floor(2*m/6), floor(3*m/6), floor(4*m/6), floor(5*m/6), m];
figure;
for i = 1:6
    subplot(2,3,i);
    re = important(i);
    newDirector2x = [zeros(1,n+2); zeros(n,1), director2x(:,:,re), zeros(n,1); zeros(1,n+2)];
    newDirector2y = [zeros(1,n+2); zeros(n,1), director2y(:,:,re), zeros(n,1); zeros(1,n+2)];
    quiver(X,Y,newDirector2x,newDirector2y);
    time = (important(i)-1)*dt;
    title(num2str(time,'t=%.4f'));
end