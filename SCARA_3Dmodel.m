%% SCARA_3Dmodel - function for drawing SCARA robot model
% INPUT: 
%        Hloc - homogeneous matrix of model's position and
%               orientation (global system for SCARA)
%        Q    - column vector of 4 joint variables (t1,t2,e3,t4);
%               t - theta, e - epsilon
%        s    - model scale to adjust its size
% Michal Komorowski, January 2013


function SCARA_3Dmodel(Hloc,Q,s)

% R3 space unit vectors
    i = [1 0 0]';
    j = [0 1 0]';
    k = [0 0 1]';
    
% dimensions variables (j - joint, l - link)
    SCARA_model_dimensions_setting
    
% forward kinematics notation 
    e1 = ll1;
    a2 = ll2;
    a3 = ll3;
    e5 = ll5;
    
% joint variables
    t2 = Q(1,1); % rotation angle (joint 1)
    t3 = Q(2,1); % rotation angle (joint 2)
    e4 = Q(3,1); % translation  (joint 3)
    t5 = Q(4,1); % rotation angle (joint 4 ; end-effector orientation)

% FORWARD KINEMATICS - postions and orientations of the robot's parts
    H00 = Hloc; 
    H01 = Hloc*Trans(0,0,e1);
    H12 = Rot(k,t2)*Trans(a2,0,0);
    H23 = Rot(k,t3)*Trans(a3,0,0)*Rot(i,180);
    H34 = Trans(0,0,e4);
    H45 = Rot(k,t5)*Trans(0,0,e5); % coordsys of end-effector is
                                   % hidden in L_TOOL3D

    H02=H01*H12;
    H03=H02*H23;
    H04=H03*H34;
    H05=H04*H45;    
    
% draw the model
    drawCoordsys(H00,'0');                      % global coordsys {0}
    L_BOX3D(ja0,jl0,H00);                       % joint 0 (base)
    L_BOX3D(la1,ll1,H00);                       % link 1

    J_ROT3D(jr1,jh1,H01*Rot(k,t2),'1');         % joint 1 rotational + passing t2 to animate a joint
    L_BOX3D(la2,ll2,H01*Rot(k,t2)*Rot(j,90));   % link 2 + passing t2 to animate a link

    J_ROT3D(jr2,jh2,H02*Rot(k,t3),'2');         % joint 2 rotational + passing t3 to animate a joint
    L_BOX3D(la3,ll3,H02*Rot(k,t3)*Rot(j,90));   % link 3 + passing t3 to animate a link

    J_TRANS3D(ja3,jl3,H03,'3');                 % joint 3 translational
    L_BOX3D(la4,ll4,H04*Trans(0,0,-ll4));       % link 4 minus link length (local origin point is on the link's end)

    J_ROT3D(jr4,jh4,H04*Rot(k,t5),'4');         % joint 4 rotational for end-effector orientation + passing t5 to animate

    L_TOOL3D(la5,ll5,H05*Trans(0,0,-ll5),'5');  % end-effector minus its length (local origin point at the end)

    axis vis3d;
    
end