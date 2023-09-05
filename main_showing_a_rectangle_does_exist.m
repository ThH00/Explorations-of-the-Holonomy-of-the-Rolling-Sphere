% I want to verify with total certainty that there does not exist one
% rectangle that can be traced to obtain the rotation of an angle 
% psi = 3*pi/2 about an axis s = 0.1*(A1+A3)+sqrt(98)*A2

global psi s1 s2 s3 a b c

psi = 1.5*pi;   % angle of rotation
s = [0.1; sqrt(1-0.1^2-0.1^2); 0.1];    % axis of rotation

s1 = s(1);
s2 = s(2);
s3 = s(3);

a = cos(psi/2);
b = sin(psi/2)*s2;
c = sin(psi/2)^2*(s1^2+s3^2);

%% see that there is no intersection visually
get_surfaces_intersection_plots();

%% find all possible phi2 solution ranges graphically up to 10^-3 precision
[phi2_plus, phi2_minus] = get_phi2_values_graphically();

datatip(phi2_plus,[2.75118933490534],[0.00703615522090417]);
datatip(phi2_plus,[2.78175810529318],[-0.312251836273750]);
datatip(phi2_plus,[5.86920391446473],[0.101489962295128]);
datatip(phi2_plus,[5.89977268485256],[-0.205299901254865]);

datatip(phi2_minus,[2.35379531986346],[0.0267961653976223]);
datatip(phi2_minus,[2.38436409025130],[-0.0611615739554625]);
datatip(phi2_minus,[5.50237866981068],[0.0364393065673223]);
datatip(phi2_minus,[5.53294744019852],[-0.0498980469252357]);

% so our four approximate solutions lie in the ranges
% f_plus
phiplus_1 = [2.75118933490534, 2.78175810529318];
fplus_1 = [-0.312252, 0.00703616];

phiplus_2 = [5.86920391446473, 5.89977268485256];
fplus_2 = [-0.2053, 0.10149];

% f_minus
phiminus_1 = [2.35379531986346, 2.38436409025130];
fminus_1 = [-0.0611616, 0.0267962];

phiminus_2 = [5.50237866981068, 5.53294744019852];
fminus_2 = [-0.049898, 0.0364393];

%% narrow down interval
phi2 = [phiplus_1, phiplus_2, phiminus_1, phiminus_2]';
[phi2, ~] = get_narrowed_interval(phi2);

%% manual calculations
% removing any complex candidates
phi2 = linspace(phi2(1),phi2(2),100)';
[phi2, theta] = get_second_narrowed_interval(phi2);

%% final checks
psi = 3*pi/2;
s1 = 0.1;
s3 = 0.1;
s2 = sqrt(1-s1^2-s3^2);

a = cos(psi/2);
b = sin(psi/2)*s2;
c = sin(psi/2)^2*(s1^2+s3^2);

f_minus = 1-sqrt(1-c./sin(phi2/2).^2)+cos(phi2)./sin(phi2)*2*b-2*a;
q_desired = sin(psi/2)*[s1;s2;s3];

% checking q0
q0_desired = cos(psi/2);
q0_calculated = 0.5*(1+cos(theta(:,1))+cos(phi2)-cos(theta(:,1)).*cos(phi2));

% checking q
[q_calculated_pos_theta] = get_q_calculated(phi2,theta(:,1));
[q_calculated_neg_theta] = get_q_calculated(phi2,theta(:,2));




