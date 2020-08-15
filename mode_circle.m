% CIRCLE
% Michal Komorowski, January 2013

t0 = 0; % initital time
for t = t0:5:3600
    
    %% end-effector motion plan
    f = 1/360;      % frequency
    w = 2*pi*f;     % angular frequency
    
    % parametric curve
    xzad = 2*sin(w*t);
    yzad = 2*cos(w*t);
    zzad = 0;
    
    % joint variables calculation (inverse kinematics)
    D  = (xzad^2+yzad^2 - ll2^2-ll3^2) / (2*ll2*ll3);               % auxilliary variable
    t3 = atan2(sqrt(1-D^2), D);                                     % second joint variable - rotation angle
    t2 = atan2(yzad,xzad) - atan2(ll3*sin(t3), ll2+ll3*cos(t3));    % first joint variable - rotation angle
    e4 = ll1-ll5-zzad;                                              % third joint variable - joint translation
    t2 = degreedize(t2);                                            % radians -> degrees
    t3 = degreedize(t3);
    t5 = t2+t3;                                                     % angle compensation for globally constant end-effector orientation
    
    % setting space for new animation frame
    cla                     % clear objects
    
    % draw the model (forward kinematics) and trajectory point
    Q = [t2 t3 e4 t5]';     % robot's joint variables
    SCARA_3Dmodel(Hloc,Q,s);
    tn = t0:1:t;            % time till now
    plot3(2*sin(w*tn), 2*cos(w*tn), zeros(1,length(tn)),'-k','LineWidth',2); % draw trajectory till now
    axis vis3d;
    drawnow                 % draw new frame
end % t