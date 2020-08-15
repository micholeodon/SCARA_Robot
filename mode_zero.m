% "ZERO" CONFIGURATION 
% model drawing (forward kinematics) and trajectory point
% Michal Komorowski, January 2013

cla; % clear objects

Q = [0 0 0 0]';             % robots joint variables
SCARA_3Dmodel(Hloc,Q,s);    % draw robot model in 3-D space
axis vis3d;                 % keep proportions