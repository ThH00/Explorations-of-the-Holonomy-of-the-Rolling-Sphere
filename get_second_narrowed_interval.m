function [phi2, theta] = get_second_narrowed_interval(phi2)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

%% calculating the possible admissible theta values

[theta] = get_theta_from_phi2(phi2);

% if both values of theta at the ends of the interval are complex, then
% there are no solutions in the interval
n = length(phi2);
keep_index = ones(n,1);
for i = 1:2:n
    if ~isreal(theta(i,1)) && ~isreal(theta(i+1,2))
        keep_index(i:i+1) = [0 0];
    end
end
phi2 = phi2.*keep_index;
phi2 = nonzeros(phi2);

[theta] = get_theta_from_phi2(phi2);

%% eliminating more values
% test other two eqs on both sides of the interval. if the answer does not
% change sign, then our solution is not in said interval
% here I am looking on every pair of consecutive integers

[test1, test2] = get_tests(phi2, theta);

n = length(phi2);
keep_index = zeros(n,1);
for i = 1:n-1
    if test1(i)*test1(i+1)<=0 && test2(i)*test2(i+1)<=0
        keep_index(i:i+1) = [1 1];
    end
end
phi2 = phi2.*keep_index;
phi2 = nonzeros(phi2);

[theta] = get_theta_from_phi2(phi2);

end