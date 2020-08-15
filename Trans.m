%% homogeneous matrix: translation
% Michal Komorowski, January 2013

function H = Trans(px,py,pz)

H = [   1 0 0 px; ...
        0 1 0 py; ...
        0 0 1 pz; ...
        0 0 0 1     ];

end