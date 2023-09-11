function [phi2_sols] = get_phi2_values_numerically()
%get_phi2_values_numerically obtained the values of phi2 numerically
%   The code first plots f(phi2), obtains solution intervals, and solves
%   for phi2. This part of the code should be adapted to each angle and
%   axis of rotation values.

global a b c

epsilon = 0.01;

k = 2*asin(sqrt(c));

phi2 = [linspace(k,pi-epsilon,50)';
    linspace(pi+epsilon,2*pi-k,50)';
    linspace(2*pi+k,3*pi-epsilon,50)'];
f_plus = 1+sqrt(1-c./sin(phi2/2).^2)+cos(phi2)./sin(phi2)*2*b-2*a;
f_minus = 1-sqrt(1-c./sin(phi2/2).^2)+cos(phi2)./sin(phi2)*2*b-2*a;

figure()
hold on


subplot(1,2,1)
hold on
plot(phi2(1:50),f_plus(1:50),'color','black');
plot(phi2(51:100),f_plus(51:100),'color','black');
plot(phi2(101:150),f_plus(101:150),'color','black');
axis([0,3*pi,-50,50])
plot([0 3*pi],[0 0],'color','black')
xlabel('$\varphi_2$','Interpreter','latex')
ylabel('$f_{plus}(\varphi_2)$','Interpreter','latex')
title('Solving for the roots of $f_{plus}(\varphi_2)=0$','Interpreter','latex')

subplot(1,2,2)
hold on
plot(phi2(1:50),f_minus(1:50),'color','black');
plot(phi2(51:100),f_minus(51:100),'color','black');
plot(phi2(101:150),f_minus(101:150),'color','black');
axis([0,3*pi,-50,50])
plot([0 3*pi],[0 0],'color','black')
xlabel('$\varphi_2$','Interpreter','latex')
ylabel('$f_{minus}(\varphi_2)$','Interpreter','latex')
title('Solving for the roots of $f_{minus}(\varphi_2)=0$','Interpreter','latex')

syms x real

f_plus_sym = 1+sqrt(1-c./sin(x/2).^2)+cos(x)./sin(x)*2*b-2*a;
s1 = double(vpasolve(f_plus_sym==0, x, [k, pi-epsilon]));
s2 = double(vpasolve(f_plus_sym==0, x, [pi+epsilon, 2*pi-k]));
s3 = double(vpasolve(f_plus_sym==0, x, [2*pi+k, 3*pi]));

f_minus_sym = 1-sqrt(1-c./sin(x/2).^2)+cos(x)./sin(x)*2*b-2*a;
s4 = double(vpasolve(f_minus_sym==0, x, [k, pi-epsilon]));
s5 = double(vpasolve(f_minus_sym==0, x, [pi+epsilon, 2*pi-k]));
s6 = double(vpasolve(f_minus_sym==0, x, [2*pi+k, 3*pi]));

y1 = double(subs(f_plus_sym,'x',s1));
y2 = double(subs(f_plus_sym,'x',s2));
y3 = double(subs(f_plus_sym,'x',s3));
y4 = double(subs(f_minus_sym,'x',s4));
y5 = double(subs(f_minus_sym,'x',s5));
y6 = double(subs(f_minus_sym,'x',s6));

subplot(1,2,1)
pt1 = plot(s1,y1,'*','color','blue');
pt2 = plot(s2,y2,'*','color','blue');
pt3 = plot(s3,y3,'*','color','blue');
datatip(pt1,s1,y1);
datatip(pt2,s2,y2);
datatip(pt3,s3,y3);

subplot(1,2,2)
pt4 = plot(s4,y4,'*','color','blue');
pt5 = plot(s5,y5,'*','color','blue');
pt6 = plot(s6,y6,'*','color','blue');
datatip(pt4,s4,y4);
datatip(pt5,s5,y5);
datatip(pt6,s6,y6);

phi2_sols = [s1; s2; s3; s4; s5; s6];

end

