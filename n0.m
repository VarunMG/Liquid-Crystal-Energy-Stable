function n = n0(x,y)
n = zeros(2,1);
%initial condition modified from equation 4.2 in the paper
%the initial condition in the paper is different but Seven noticed that the
%initial condition given was always parallel to (1,1,0) and was not
%satisfying the Dirichlet conditions so this corrects for that
%comment and uncomment initial conditions as you wish
n1 = sin(2*pi*x)*sin(2*pi*y);
n2 = sin(2*pi*x)*sin(2*pi*y);
%%%%%%%%%%%%%%%
% if sqrt((x-1)^2+(y-1)^2) < 0.5
%     n1 = 1;
%     n2 = 1;
% elseif sqrt((x-2)^2+y^2) < 0.5
%     n1 = 1;
%     n2 = 1;
% elseif sqrt(x^2+(y-2)^2) < 0.5
%     n1 = 1;
%     n2 = 1;
% elseif sqrt(x^2+y^2) < 0.5
%     n1 = 1;
%     n2 = 1;
% elseif sqrt((x-2)^2+(y-2)^2) < 0.5
%     n1 = 1;
%     n2 = 1;
% else
%     n1 = -1;
%     n2 = 1;
% end
%%%%%%%%%%%%%%
% if y >= x && y <= 2-x
%     n1 = 1;
%     n2 = 0;
% elseif y > 2-x && y > x
%     n1 = 0;
%     n2 = -1;
% elseif y < x && y > 2-x
%     n1 = -1;
%     n2 = 0;
% else y < x && y<2-x;
%     n1 = 0; 
%     n2 = 1;
% end
% ep = 0.01;
% n1 = x+ep;
% n2 = y+ep;
% n1 = x;
% n2 = -y;
n(1) = n1;
n(2) = n2;
end