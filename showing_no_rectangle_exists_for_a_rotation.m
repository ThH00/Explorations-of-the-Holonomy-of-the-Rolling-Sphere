%% getting approximate phi2 values: 4 answers

psi = 3*pi/2;
s1 = 0.1;
s3 = 0.1;
s2 = sqrt(1-s1^2-s3^2);

a = cos(psi/2);
b = sin(psi/2)*s2;
c = sin(psi/2)^2*(s1^2+s3^2);

phi2 = linspace(0,2*pi-0.2,200);
f_plus = 1+sqrt(1-c./sin(phi2/2).^2)+cos(phi2)./sin(phi2)*2*b-2*a;
f_minus = 1-sqrt(1-c./sin(phi2/2).^2)+cos(phi2)./sin(phi2)*2*b-2*a;

figure(1)
hold on
plot(phi2,f_plus)
axis([0,2*pi,-1,1])
plot([0 2*pi],[0 0])

% phi2 = 2.75119, f_plus = 0.00703616
% phi2 in (5.8692, 5.89977), f_plus in (-0.2053, 0.10149)

figure(2)
hold on
plot(phi2,f_minus)
axis([0,2*pi,-1,1])
plot([0 2*pi],[0 0])

% phi2 in (2.3538, 2.38436), f_minus in (-0.0611616, 0.0267962)
% phi2 in (5.50238, 5.53295) f_minus in (-0.049898, 0.0364394)

%% zoning in on values correct up to 4 sig figs
phi2_val = [2.750, 2.751, 2.75119, 2.752];
f = zeros(length(phi2_val),1);
for i = 1:length(phi2_val)
    f(i) = 1+sqrt(1-c./sin(phi2_val(i)/2).^2)+cos(phi2_val(i))./sin(phi2_val(i))*2*b-2*a;
end

phi2_val = [5.8692, 5.878, 5.879, 5.880];
f = zeros(length(phi2_val),1);
for i = 1:length(phi2_val)
    f(i) = 1+sqrt(1-c./sin(phi2_val(i)/2).^2)+cos(phi2_val(i))./sin(phi2_val(i))*2*b-2*a;
end

phi2_val = [2.361,2.362,2.363,2.364,2.365,2.366];
f = zeros(length(phi2_val),1);
for i = 1:length(phi2_val)
    f(i) = 1-sqrt(1-c./sin(phi2_val(i)/2).^2)+cos(phi2_val(i))./sin(phi2_val(i))*2*b-2*a;
end

phi2_val = [5.515, 5.516, 5.517, 5.518, 5.52];
f = zeros(length(phi2_val),1);
for i = 1:length(phi2_val)
    f(i) = 1-sqrt(1-c./sin(phi2_val(i)/2).^2)+cos(phi2_val(i))./sin(phi2_val(i))*2*b-2*a;
end

%% checking is phi2 values are admissible
phi2_test = [2.752; 5.880; 2.363; 5.516];

theta_test = zeros(4,2);
eq1_test = zeros(4,2);
for i = 1:length(phi2_test)
    theta_test(i,1) = acos((2*a-1-cos(phi2_test(i)))/(1-cos(phi2_test(i))));
    theta_test(i,2) = -theta_test(i,1);
    eq1_test(i,1) = sin(theta_test(i,1)/2)^2*sin(phi2_test(i))-b;
    eq1_test(i,2) = sin(theta_test(i,2)/2)^2*sin(phi2_test(i))-b;
end

phi1_test = phi2_test/2+atan2(s1,-s3);

