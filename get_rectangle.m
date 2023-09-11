function [theta, phi2, phi1] = get_rectangle(angle, s)
%get_rectangle Obtains parameters theta, phi2, phi1 of a rectangle that
%when traced yields a rotation of a specified angle about the axis s
%   angle: scalar angle between (0,2*pi)
%   s: 3x1 components of axis of rotation

global psi s1 s2 s3 a b c
psi = angle;

s1 = s(1);
s2 = s(2);
s3 = s(3);

a = cos(psi/2);
b = sin(psi/2)*s2;
c = sin(psi/2)^2*(s1^2+s3^2);

%% find all possible phi2 solution ranges graphically
[phi2] = get_phi2_values_numerically();

%% get theta values
[theta] = get_theta(phi2);

%% narrowing down candidates
% delete phi2 values corresponding to theta values that do not belong to
% the set of real numbers
keep_index = zeros(length(phi2),1);
for i = 1:length(phi2)
    if isreal(theta(i,1))
        keep_index(i) = 1;
    end
end
phi2 = phi2.*keep_index;
phi2 = nonzeros(phi2);
[theta] = get_theta(phi2);

% test if the remaining equations are valid
[test1, test2] = get_tests(phi2, theta);
% the tests will have same value for positive and negative theta
% delete the candidates that do not satisfy test 1 and test 2
epsilon = 1.0e-10;
keep_index = zeros(length(phi2),1);
for i = 1:length(phi2)
    if abs(test1(i,1))<epsilon && abs(test2(i,1))<epsilon
        keep_index(i) = 1;
    end
end
phi2 = phi2.*keep_index;
phi2 = nonzeros(phi2);
[theta] = get_theta(phi2);

% final check: reconstruct the quaternion rotation and see if the answers
% match
% doing some reconfigurations
phi2 = [phi2; phi2];
theta = [theta(:,1); theta(:,2)];
% checking q0
q0_desired = cos(psi/2);
q0_calculated = 0.5*(1+cos(theta)+cos(phi2)-cos(theta).*cos(phi2));
q0_error = abs(q0_desired-q0_calculated);
% checking q
phi1 = zeros(length(phi2),2);
q_desired = sin(psi/2)*[s1;s2;s3];
[q_calculated,phi1] = get_q_calculated(phi2,theta);
q_error = abs(q_calculated-q_desired); % make into norms

keep_index = zeros(length(phi2),1);
% also keep values where phi1<=phi2
for i = 1:length(phi2)
    if q0_error(i)<epsilon && norm(q_error(:,i))<epsilon
        keep_index(i) = 1;
    end
end
phi2 = phi2.*keep_index;
phi2 = nonzeros(phi2);
theta = theta.*keep_index;
theta = nonzeros(theta);
phi1 = phi1.*keep_index;
phi1 = nonzeros(phi1);


%% present final answers
disp('The possible solutions are')
for i = 1:length(phi2)
    disp(['theta = ', num2str(theta(i,1)), ', phi2 = ', num2str(phi2(i)),', phi1 = ',num2str(phi1(i))])
end

end

