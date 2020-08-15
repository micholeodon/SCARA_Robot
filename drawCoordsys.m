%% coordsys drawing according to H matrix (orientation and position)
% Michal Komorowski, January 2013

function drawCoordsys(H, coordsysName)
Ori0 = [0 0 0 1]';
End0X = [1 0 0 1]';
End0Y = [0 1 0 1]';
End0Z = [0 0 1 1]';

% coordsys transform
Ori = H *Ori0;
EndX = H*End0X;
EndY = H*End0Y;
EndZ = H*End0Z;

% axis of the transformed coordsys
plot3([Ori(1,1) EndX(1,1)],[Ori(2,1) EndX(2,1)],[Ori(3,1) EndX(3,1)],'b','LineWidth',2); % X axis
plot3([Ori(1,1) EndY(1,1)],[Ori(2,1) EndY(2,1)],[Ori(3,1) EndY(3,1)],'g','LineWidth',2); % Y axis
plot3([Ori(1,1) EndZ(1,1)],[Ori(2,1) EndZ(2,1)],[Ori(3,1) EndZ(3,1)],'r','LineWidth',2); % Z axis

% coordsys name
text(Ori(1,1)-1, Ori(2,1)-0.5, Ori(3,1), coordsysName, 'FontSize', 12, 'FontWeight', 'bold');
end