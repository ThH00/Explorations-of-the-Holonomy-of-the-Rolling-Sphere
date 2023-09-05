function [phi2_plus, phi2_minus] = get_phi2_values_graphically()
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

global psi s1 s2 s3 a b c

phi2 = linspace(0,2*pi-0.2,200);
f_plus = 1+sqrt(1-c./sin(phi2/2).^2)+cos(phi2)./sin(phi2)*2*b-2*a;
f_minus = 1-sqrt(1-c./sin(phi2/2).^2)+cos(phi2)./sin(phi2)*2*b-2*a;

figure()
hold on
phi2_plus = plot(phi2,f_plus);
axis([0,2*pi,-1,1])
plot([0 2*pi],[0 0])

figure()
hold on
phi2_minus = plot(phi2,f_minus);
axis([0,2*pi,-1,1])
plot([0 2*pi],[0 0])

end

