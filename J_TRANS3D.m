%% draw solid for translational joint according to H matrix and coordsys it represents
% Michal Komorowski, January 2013


function J_TRANS3D(a,l,H,number) 
% box TransZ: 
%    a - side lenght,
%    l - height,
%    H - position and orientation matrix,
%    number - joint nr

% PREPARATION 
 k = [0 0 1]';
% Vertex matrix
    % helper notation
 Vertices = [ a/2  a/2 -l/2
             -a/2  a/2 -l/2
             -a/2 -a/2 -l/2
              a/2 -a/2 -l/2
              a/2  a/2  l/2
             -a/2  a/2  l/2
             -a/2 -a/2  l/2
              a/2 -a/2  l/2
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
  faceColor  =  [0 0.8 0.8]; % [R G B] range 0-1
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
 
 % draw coordsys
 drawCoordsys(H,number);
 
end
