% Define theta in degrees
theta = 0:1:360;

% Create a figure
figure;

% First subplot: Cosine function
subplot(6, 1, 1);
cosine_theta = cosd(theta); % Use cosd for degrees
plot(theta, cosine_theta);
title('Cosine Function');
xlabel('Theta (degrees)');
ylabel('cos(\theta)');
grid on;

% Second subplot: Sine function
subplot(6, 1, 2);
sine_theta = sind(theta); % Use sind for degrees
plot(theta, sine_theta);
title('Sine Function');
xlabel('Theta (degrees)');
ylabel('sin(\theta)');
grid on;

% Third subplot: Addition of sine and cosine
subplot(6, 1, 3);
sinePlusCos = sine_theta + cosine_theta; % Addition
plot(theta, sinePlusCos);
title('Sine + Cosine');
xlabel('Theta (degrees)');
ylabel('sin(\theta) + cos(\theta)');
grid on;

% Fourth subplot: Subtraction of sine from cosine
subplot(6, 1, 4);
sineMinusCos = sine_theta - cosine_theta; % Subtraction
plot(theta, sineMinusCos);
title('Sine - Cosine');
xlabel('Theta (degrees)');
ylabel('sin(\theta) - cos(\theta)');
grid on;

% Fifth subplot: Product of sine and cosine
subplot(6, 1, 5);
sineTimesCos = sine_theta .* cosine_theta; % Element-wise multiplication
plot(theta, sineTimesCos);
title('Sine * Cosine');
xlabel('Theta (degrees)');
ylabel('sin(\theta) * cos(\theta)');
grid on;

% Sixth subplot: Cosine - Sine
subplot(6, 1, 6);
cosineMinusSine = cosine_theta - sine_theta; % Cosine minus Sine
plot(theta, cosineMinusSine);
title('Cosine - Sine');
xlabel('Theta (degrees)');
ylabel('cos(\theta) - sin(\theta)');
grid on;

% Add a common title for the entire figure
sgtitle('Trigonometric Functions with Addition, Subtraction, and Product');
