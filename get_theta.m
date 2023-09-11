function [theta] = get_theta(phi2)
%get_theta calculated the angle theta
%   phi2: given rectangle parameter

global a

n = length(phi2);
theta = zeros(n,2);
for i = 1:n
    theta(i,1) = acos((2*a-1-cos(phi2(i)))/(1-cos(phi2(i))));
    theta(i,2) = 2*pi-theta(i,1); % adding 2*pi to make positive
end

end
