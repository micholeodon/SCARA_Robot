% LINE
% Michal Komorowski, January 2013

time0 = 0;      % start time 
time1 = 400;    % finish time; regulates line drawing speed
x0 = -3;        % line's starting point
y0 = -3;
z0 = 3;
x1 = 4;         % line's finishing point
y1 = 2;
z1 = 0;

for t = time0:5:time1

    % destination points according to parametric equations
    xzad = t/time1*x1+(time1-t)/time1*x0; 
    yzad = t/time1*y1+(time1-t)/time1*y0;
    zzad = t/time1*z1+(time1-t)/time1*z0;
    
    % joint variables calculation (inverse kinematiocs)
    D = (xzad^2+yzad^2 -ll2^2-ll3^2) / (2*ll2*ll3);             % auxilliary variable
    t3 = atan2(sqrt(1-D^2),D);                                  % second joint variable (rotation angle)
    t2 = atan2(yzad,xzad)-atan2(ll3*sin(t3),ll2+ll3*cos(t3));   % first joint variable (rotation angle)
    e4 = ll1-ll5-zzad;                                          % third joint variable (joint translation)
    t2 = degreedize(t2);                                        % radians -> degrees
    t3 = degreedize(t3);
    t5 = 0;
    
    % setting space for new animation frame
    cla                         % clear objects

    % draw the model (forward kinematics) and trajectory point
    Q = [t2  t3 e4 t5]';        % robot's joint variables
    SCARA_3Dmodel(Hloc,Q,s);
    tn = time0:1:t;             % time till now
    plot3(tn/time1*x1+(time1-tn)/time1*x0,tn/time1*y1+(time1-tn)/time1*y0,tn/time1*z1+(time1-tn)/time1*z0,'-k','LineWidth',2);
    axis vis3d;
    drawnow                     % draw new frame
end % t