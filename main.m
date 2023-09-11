% Explorations of the Holonomy of the Rolling Sphere - Appendix B
% Last updated by Theresa Honein on 09/11/2023.

psi = 1.5*pi;   % angle of rotation
s = [0.1; sqrt(1-0.1^2-0.1^2); 0.1];    % axis of rotation

[theta, phi2, phi1] = get_rectangle(psi, s);