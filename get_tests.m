function [test1, test2] = get_tests(phi2, theta)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

global psi s1 s2 s3 a b c

n = length(phi2);
test1 = zeros(n,2);
for i = 1:n
    test1(i,1) = sin(theta(i,1)/2)^2*sin(phi2(i))-b;
    test1(i,2) = sin(theta(i,2)/2)^2*sin(phi2(i))-b;
    test2(i,1) = sin(theta(i,1))^2*sin(phi2(i)/2)^2-c;
    test2(i,2) = sin(theta(i,2))^2*sin(phi2(i)/2)^2-c;
end

end

