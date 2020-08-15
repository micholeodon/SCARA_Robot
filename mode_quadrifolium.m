% QUADRIFOLIUM
% Michal Komorowski, January 2013

t0 = 0;     % initial time
a = 3;      % trajectory scale
for t = t0:5:3600

    % destination points according to parametric equations
    f = 1/360;      % frequency
    w = 2*pi*f;     % angular frequency
    xzad = 4;
    yzad = a*sin(2*w*t)*cos(w*t);
    zzad = a*sin(w*t)*sin(2*w*t)+2;
    
    % joint variables calculation (inverse kinematics)
    D = (xzad^2+yzad^2-ll2^2-ll3^2)/(2*ll2*ll3);                % auxilliary variable
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
    tn = t0:1:t;                % time till now
    plot3(xzad*ones(1,length(tn)),a*sin(2*w*tn).*cos(w*tn),a*sin(w*tn).*sin(2*w*tn)+2,'-k','LineWidth',2);
    axis vis3d;
    drawnow                     % draw new frame
end % t

