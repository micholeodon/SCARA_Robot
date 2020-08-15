%% Init visualization space (cubic)
% Michal Komorowski, January 2013

function InitSpace(size)
figure

axis([-size size -size size -size size]); % axes limits
X = [-size size];
O = [0 0];

axis vis3d; % keeps right proportions
grid on;

% helper lines
hold on;
plot3(X,O,O,'k:');
plot3(O,X,O,'k:');
plot3(O,O,X,'k:');

xlabel('X'); % axis labels
ylabel('Y');
zlabel('Z');

view(160,20); % camera angle