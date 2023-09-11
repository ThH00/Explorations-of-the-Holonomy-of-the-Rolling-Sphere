function [q_calculated,phi1] = get_q_calculated(phi2,theta)
%get_q_calculated calculates the second quaternion parameter of the
%rotation
%   phi2: rectangle parameter (side 1 length)
%   theta: rectangle parameter (side 2 length)
%   phi1: calculated through knowledge of phi2, theta, and the rotation.

global psi s1 s3

A1 = [1;0;0];
A2 = [0;1;0];
A3 = [0;0;1];

n = length(phi2);
q_calculated = zeros(3,n);
phi1_fun = zeros(n,1);
phi1 = zeros(n,1);
for i = 1:n
    y = sin(psi/2)*s1/(sin(theta(i))*sin(phi2(i)/2));
    x = -sin(psi/2)*s3/(sin(theta(i))*sin(phi2(i)/2));
    phi1_fun(i) =  atan2(y,x);
    phi1(i) = phi2(i)/2+phi1_fun(i);
    if phi1(i)<=phi2(i)
        Ar = -cos(phi1_fun(i))*A3+sin(phi1_fun(i))*A1;
        q_calculated(:,i) = sin(theta(i))*sin(phi2(i)/2)*Ar+sin(phi2(i))*sin(theta(i)/2)^2*A2;
    end
end


end
