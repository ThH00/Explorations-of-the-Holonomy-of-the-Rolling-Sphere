function [theta] = get_theta_from_phi2(phi2, psi, s)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

global psi s1 s2 s3 a b c

n = length(phi2);
theta = zeros(n,2);
for i = 1:n
    theta(i,1) = acos((2*a-1-cos(phi2(i)))/(1-cos(phi2(i))));
    theta(i,2) = -theta(i,1);
end

end

