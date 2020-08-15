%% homogeneous matrix: rotation around unit vector u by angle theat
% Michal Komorowski, January 2013

function H = Rot(u,theta)

c = @cosd; 
s = @sind;
th = theta;     % angle theta
ux = u(1,1);    % unit vector coordinates
uy = u(2,1);
uz = u(3,1);

% rotation matrix assembly
M1 = u*u'*(1-c(th));
M2 = [      c(th), -uz*s(th),  uy*s(th); ...
         uz*s(th),     c(th), -ux*s(th); ...
        -uy*s(th),  ux*s(th),     c(th)    ];
R = M1+M2; % rotation matrix

H = [R, zeros(3,1); ...
     zeros(1,3),1]; % homogeneous rotation matrix
end
