radius = 360; % Example radius
area = pi * radius^2;
disp(['The area of the circle with radius ', num2str(radius), ' is ', num2str(area)]);

% Plotting the circle
theta = linspace(0, 2*pi, 360); % Angle from 0 to 2*pi
x = radius * cos(theta); % X coordinates
y = radius * sin(theta); % Y coordinates
figure; % Create a new figure
plot(x, y); % Plot the circle
axis equal; % Set equal scaling
title(['Circle with radius ', num2str(radius)]); % Title
xlabel('X-axis'); % X-axis label
ylabel('Y-axis'); % Y-axis label
grid on;