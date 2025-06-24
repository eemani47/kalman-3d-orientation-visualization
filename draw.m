function draw(roll, pitch, yaw)
persistent h
if isempty(h)
    h = figure('Name', '3D Cube'); axis equal; grid on;
    xlabel('X'); ylabel('Y'); zlabel('Z'); view(3);
end
clf(h); hold on

Rx = [1 0 0; 0 cos(roll) -sin(roll); 0 sin(roll) cos(roll)];
Ry = [cos(pitch) 0 sin(pitch); 0 1 0; -sin(pitch) 0 cos(pitch)];
Rz = [cos(yaw) -sin(yaw) 0; sin(yaw) cos(yaw) 0; 0 0 1];

R = Rz * Ry * Rx;

verts = [-1 -1 -1; 1 -1 -1; 1 1 -1; -1 1 -1;
         -1 -1  1; 1 -1  1; 1  1  1; -1  1  1]*0.5;
verts = (R * verts')';

faces = [1 2 3 4; 5 6 7 8; 1 5 8 4;
         2 6 7 3; 1 2 6 5; 4 3 7 8];

patch('Vertices', verts, 'Faces', faces, ...
      'FaceColor', [0.6 0.8 1], 'FaceAlpha', 0.6)

quiver3(0,0,0, R(1,1), R(2,1), R(3,1), 1, 'r', 'LineWidth', 2)
quiver3(0,0,0, R(1,2), R(2,2), R(3,2), 1, 'g', 'LineWidth', 2)
quiver3(0,0,0, R(1,3), R(2,3), R(3,3), 1, 'b', 'LineWidth', 2)

xlim([-1 1]); ylim([-1 1]); zlim([-1 1]);
title(sprintf('roll=%.1f deg, pitch=%.1f deg, yaw=%.1f deg', ...
              rad2deg(roll), rad2deg(pitch), rad2deg(yaw)))