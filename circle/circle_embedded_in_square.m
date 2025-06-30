% Define parameters
radius = 1; % Radius of the circle
sideLength = 2; % Side length of the square

% Create a figure
figure;

% Plot the circle
theta = linspace(0, 2*pi, 100); % Angle for circle
x_circle = radius * cos(theta); % X data for circle
y_circle = radius * sin(theta); % Y data for circle
hold on; % Hold on to plot multiple shapes
fill(x_circle, y_circle, 'b', 'FaceAlpha', 0.5, 'DisplayName', 'Circle'); % Fill circle

% Plot the square
x_square = [-1, 1, 1, -1, -1] * (sideLength / 2); % X data for square
y_square = [-1, -1, 1, 1, -1] * (sideLength / 2); % Y data for square
fill(x_square, y_square, 'r', 'FaceAlpha', 0.5, 'DisplayName', 'Square'); % Fill square

% Set axis properties
axis equal; % Equal scaling
xlim([-2 2]); % X limits
ylim([-2 2]); % Y limits
title('Circle and Square Area Plot');
xlabel('X-axis');
ylabel('Y-axis');
legend show; % Show legend
grid on; % Enable grid
hold off; % Release hold
