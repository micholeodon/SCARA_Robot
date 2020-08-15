%% FORWARD AND INVERSE KINEMATICS - SCARA MANIPULATOR
% Visualization of utilization of forward and inverse kinematics
% for SCARA assembly robot to execute given trajectory of
% its end-effector.
% Michal Komorowski, January 2013

%% Init visualization space
    clear all
    clc
    InitSpace(10); 
        i=[1 0 0]';
        j=[0 1 0]';
        k=[0 0 1]';
 
%% Load robot dimensions

    Hloc = Trans(0,0,0)*Rot(i,0); % initial robot orientation
    % dimensions' variables (j-joint,l-link)
    s = 5; % scale factor
    SCARA_model_dimensions_setting
    
% CHOOSE TRAJECTORY TO BE EXECUTED:
% mode = 0 - robot's initial static configuration
% mode = 1 - circle
% mode = 2 - line
% mode = 3 - fish
% mode = 4 - quadrifolium
% mode = 5 - Archimedean spiral
mode = 2; 
switch mode
    case 0
        mode_zero
    case 1
        mode_circle
    case 2
        mode_line
    case 3
        mode_fish
    case 4
        mode_quadrifolium
    case 5
        mode_archimedean_spiral
    otherwise
        error('Wrong value of ''mode'' variable !'); 
end

