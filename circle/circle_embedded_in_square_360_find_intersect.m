% Define parameters
radius = 100; % Radius of the circle
sideLength = 720; % Side length of the square

% Create a circle as a polyshape
theta = linspace(0, 2*pi, 360); % Angle for circle
x_circle = radius * cos(theta); % X data for circle
y_circle = radius * sin(theta); % Y data for circle
circleShape = polyshape(x_circle, y_circle); % Create circle polyshape

% Create a square as a polyshape
x_square = [-1, 1, 1, -1, -1] * (sideLength / 2); % X data for square
y_square = [-1, -1, 1, 1, -1] * (sideLength / 2); % Y data for square
squareShape = polyshape(x_square, y_square); % Create square polyshape

% Plot the circle and square
figure;
hold on;
plot(circleShape, 'FaceColor', 'b', 'FaceAlpha', 0.5, 'DisplayName', 'Circle');
plot(squareShape, 'FaceColor', 'r', 'FaceAlpha', 0.5, 'DisplayName', 'Square');
axis equal;
title('Circle and Square with Intersection');
xlabel('X-axis');
ylabel('Y-axis');
legend show;


xticks(-250:1:250); % Set X ticks with a step of 50
yticks(-250:1:250); % Set Y ticks with a step of 50
grid on; % Turn on the grid
% Find the intersection
intersectionShape = intersect(circleShape, squareShape); % Compute intersection

% Plot the intersection
plot(intersectionShape, 'FaceColor', 'g', 'FaceAlpha', 0.5, 'DisplayName', 'Intersection');
hold off;
grid on;