% Sample signal creation (for demonstration)
close;
clear;
Fs = 2000;          % Sampling frequency (Hz)
T = 1/Fs;           % Sampling period (seconds)
L = 2000;           % Length of signal
t = (0:L-1)*T;      % Time vector

% Create a sample signal: a combination of two sinusoids
%xt = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);

f1 = 100;
xt = sin(2*pi*f1*t) +sin(2*pi*2*f1*t) + cos(2*pi*3*f1*t) + sin(2*pi*4*f1*t) ;

% Compute the FFT
xf = fft(xt);
xfShifted = fftshift(xf);

% Create a frequency vector for plotting
%  A range of indices centered around 0:
f = Fs*(-L/2:L/2-1)/L;

% Create a figure to plot the FFT
figure;
plot(f, abs(xfShifted)); % Plot the magnitude of the FFT
xlabel('Frequency Index');
ylabel('FFT of x(t)');
title('FFT of x(t)');
grid on; % Optional: add grid for better readability


% Create a sample signal: a combination of two sinusoids
xt = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);

% Compute the FFT
xf = fft(xt);

% Shift the zero frequency component to the center
xf_shifted = fftshift(xf);

% Create a frequency vector for plotting
f = Fs*(-L/2:L/2-1)/L;

% Plot the shifted FFT
figure;
plot(f, abs(xf_shifted));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT of x(t) with Shift');
grid on;

