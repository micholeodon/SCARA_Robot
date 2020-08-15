%% draw solid for end-effector according to H matrix and coordsys it represents
% Michal Komorowski, January 2013

function L_TOOL3D(a,l,H, coordsysName) 
% end-effector: 
%    a - side length,
%    l - end-effector length,
%    H - position and orientation matrix, 
%    coordsysName - name of the coordsys attached

%% end-effectors arm

% PREPARATION
 k = [0 0 1]';
% Vertex matrix
    % helper notation
 Vertices = [ a/4  a/4     0
             -a/4  a/4     0
             -a/4 -a/4     0
              a/4 -a/4     0
              a/4  a/4 0.5*l
             -a/4  a/4 0.5*l
             -a/4 -a/4 0.5*l
              a/4 -a/4 0.5*l
            ];

% set position and orientation
Vertices = Vertices';
Vertices = H*[Vertices;ones(1,8)];
Vertices = Vertices(1:3,:)';
        
% matrix representing an order of joining vertices into faces
 Faces  = [   1 2 6 5
            2 3 7 6
            3 4 8 7
            4 1 5 8
            1 2 3 4
            5 6 7 8];
 % color matrix
  faceColor  =  [0.2 0.1 0]; % [R G B] range 0-1
  colormat  =    [faceColor
                faceColor
                faceColor
                faceColor
                faceColor
                faceColor
                ]; % color for each face

 %  DRAW solid
 patch('Vertices',Vertices,'Faces',Faces,'FaceVertexCData',colormat,'FaceAlpha',0.5,'FaceColor','flat');
 % FaceAlpha - 0 for transparent, 1 for opaque
 
 
%% end-effector's end

% PREPARATION 
% Vertex matrix
    % helper notation
 Vertices = [ a/2 a/2 0.5*l
           -a/2 a/2 0.5*l
            -a/2 -a/2 0.5*l
            a/2 -a/2 0.5*l
            0 0 l
           0 0 l
            0 0 l
            0 0 l
            ];
 
% set position and orientation
Vertices = Vertices';
Vertices = H*[Vertices;ones(1,8)];
Vertices = Vertices(1:3,:)';
        
% matrix representing an order of joining vertices into faces
 Faces  = [   1 2 6 5
            2 3 7 6
            3 4 8 7
            4 1 5 8
            1 2 3 4
            5 6 7 8];
 % color matrix
  faceColor  =  [0.5 0.1 0]; % [R G B] range 0-1
  colormat  =    [faceColor
                faceColor
                faceColor
                faceColor
                faceColor
                faceColor
                ]; % color for each face

 %  DRAW solid
 patch('Vertices',Vertices,'Faces',Faces,'FaceVertexCData',colormat,'FaceAlpha',0.5,'FaceColor','flat');
 % FaceAlpha - 0 for transparent, 1 for opaque
 
 % end-effector coordsys
 drawCoordsys(H*Trans(0,0,l),coordsysName);
 
end




