theta = 0:1:180*2
rowPlot = 4;
colPlot = 1;
plotPosition = 1;
%
% subplot: Pure Sine
%
subplot(rowPlot, colPlot, plotPosition);
plot(theta, sind(theta) );

xlabel('Degrees');
ylabel('sin(θ)');
title('Sine Curve from 0° to 360°');
grid on;

% Customize the grid size by setting tick marks
ax = gca; % Get current axes
ax.XTick = 0:90:360; % Set x-tick marks at intervals of 1
%ax.YTick = -1:0.5:1; % Set y-tick marks at intervals of 0.5

%
% subplot:  Sine Square
%
plotPosition = plotPosition +1;
sineTimesSine = sind(theta) .* sind(theta);

subplot(rowPlot, colPlot, plotPosition);
plot(theta, sineTimesSine );

xlabel('Degrees');
ylabel('sin^2');
title('Sine  square');
grid on;


% Customize the grid size by setting tick marks
ax = gca; % Get current axes
ax.XTick = 0:90:360; % Set x-tick marks at intervals of 1
%ax.YTick = -1:0.5:1; % Set y-tick marks at intervals of 0.5

%
% subplot:  Sine Double Angle
%
plotPosition = plotPosition +1;
sineTimesSine = sind(2*theta) ;

subplot(rowPlot, colPlot, plotPosition);
plot(theta, sineTimesSine );

xlabel('Degrees');
ylabel('sin(2θ)');
title('Double Angle');
grid on;

% Customize the grid size by setting tick marks
ax = gca; % Get current axes
ax.XTick = 0:90:360; % Set x-tick marks at intervals of 1
%ax.YTick = -1:0.5:1; % Set y-tick marks at intervals of 0.5

%
% subplot:  Sine Half Angle
%
plotPosition = plotPosition +1;
sineTimesSine = sind(theta/2) ;

subplot(rowPlot, colPlot, plotPosition);
plot(theta, sineTimesSine );

xlabel('Degrees');
ylabel('sin(θ/2)');
title('Half Angle');
grid on;

% Customize the grid size by setting tick marks
ax = gca; % Get current axes
ax.XTick = 0:90:360; % Set x-tick marks at intervals of 1
%ax.YTick = -1:0.5:1; % Set y-tick marks at intervals of 0.5

% Add a common title for the entire figure
sgtitle('Multiple Angle Plot Visualization');