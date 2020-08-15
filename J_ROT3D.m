%% draw solid for rotational joint according to H matrix and coordsys it represents
% Michal Komorowski, January 2013


function J_ROT3D(r,h,H,number) 
% CYLINDER J_ROT3D: 
%    r - radius,
%    h - height, 
%    H - position and orientation matrix,  
%    number - joint nr

% PREPARATION 
 k = [0 0 1]';

 % Vertex matrix
 % helper notation
 a = r*sqrt(3)/2;
 b = r*0.5;
 Vertices = [ r  0 -h/2
              b  a -h/2
             -b  a -h/2
             -r  0 -h/2
             -b -a -h/2
              b -a -h/2
              r  0  h/2
              b  a  h/2
             -b  a  h/2
             -r  0  h/2
             -b -a  h/2
              b -a  h/2
            ];
 
% set position and orientation 
Vertices = Vertices';
Vertices = H*[Vertices;ones(1,12)];
Vertices = Vertices(1:3,:)';
        
% matrix representing an order of joining vertices into faces
 Faces  = [   1 2 8 7 7 7
            2 3 9 8 8 8
            3 4 10 9 9 9
            4 5 11 10 10 10
            5 6 12 11 11 11
            6 1 7 12 12 12
            1 2 3 4 5 6 
            7 8 9 10 11 12];
        
 % color matrix
  faceColor  =  [0.8 0.8 0]; % [R G B] range 0-1
  colormat  =    [faceColor
                  faceColor
                  faceColor
                  faceColor
                  faceColor
                  faceColor
                  faceColor
                  faceColor]; % color for each face

 % draw solid 
 patch('Vertices',Vertices,'Faces',Faces,'FaceVertexCData',colormat,'FaceAlpha',0.5,'FaceColor','flat');
 % FaceAlpha - 0 for transparent, 1 for opaque
 
 % draw coordsys
 drawCoordsys(H,number);
 
end

