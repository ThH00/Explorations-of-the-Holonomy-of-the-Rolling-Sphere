function [] = get_surfaces_intersection_plots()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

global psi s1 s2 s3 a b c

n = 20;
theta = linspace(0,2*pi,n);
phi2 = linspace(0,2*pi,n);

surf1 = zeros(n,n);
surf2 = zeros(n,n);
surf3 = zeros(n,n);

a = cos(psi/2);
b = s2*sin(psi/2);
c = (s1^2+s3^2)*sin(psi/2)^2;

for i = 1:n
    for j = 1:n
        surf1(i,j) = 0.5*(1+cos(theta(i))+cos(phi2(j))...
            -cos(theta(i))*cos(phi2(j)))-a;
        surf2(i,j) = sin(theta(i))^2*sin(phi2(j)/2)^2-c;
        surf3(i,j) = sin(theta(i)/2)^2*sin(phi2(j))-b;
    end
end

[Theta, Phi2] = meshgrid(theta, phi2);
figure()
hold on
Surf1 = surf(Theta, Phi2, surf1);
Surf2 = surf(Theta, Phi2, surf2);
Surf3 = surf(Theta, Phi2, surf3);
set(Surf1,'FaceColor',[1 0 0],'FaceAlpha',0.5);
set(Surf2,'FaceColor',[0 1 0],'FaceAlpha',0.5);
set(Surf3,'FaceColor',[0 0 1],'FaceAlpha',0.5);

end

