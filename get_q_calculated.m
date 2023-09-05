function [q_calculated] = get_q_calculated(phi2,theta)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

global psi s1 s2 s3 a b c

A1 = [1;0;0];
A2 = [0;1;0];
A3 = [0;0;1];

n = length(phi2);
q_calculated = zeros(3,n);
phi1_fun = zeros(n,1);
for i = 1:n
    y = sin(psi/2)*s1/(sin(theta(i))*sin(phi2(i)/2));
    x = -sin(psi/2)*s3/(sin(theta(i))*sin(phi2(i)/2));
    phi1_fun(i) =  atan2(y,x);
    Ar(:,i) = -cos(phi1_fun(i))*A3+sin(phi1_fun(i))*A1;
    q_calculated = sin(theta(i))*sin(phi2(i)/2)*Ar+sin(phi2(i))*sin(theta(i)/2)^2*A2;
end


end

