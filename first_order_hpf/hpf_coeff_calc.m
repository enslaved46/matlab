% Create a First order HPF with -3dB at 10K
clear;
close all;

%Filter Cutoff
Fc = 10e3;
%angular rate
omega = 2* pi * Fc;

% Tau = RC => Fc = 1/WcRc
Tau = 1/(2*pi*Fc);

%sampling Period
Fs =  2*Fc*10 ;                % Sampling frequency (Hz)
Ts = 1/Fs; 
t = 0:Ts:0.005;  % 5 ms of signal
% for FFT bins
N = length(t);

% Filter Coeff Calc
% Parameters
K =  (2*Tau/Ts);
alpha = K/(1+K);
beta  = (1-K)/(1+K);

% noisy sine wave
%input wave
x = sin(2*pi*1000*t) + sin(2*pi*50*t) + sin(2*pi*30000*t) + 0.5*randn(size(t));  % 1 kHz sine + noise
%x = sin(2*pi*1000*t) + sin(2*pi*30000*t);  % 1kHz + 30kHz components

% Preallocate output
y = zeros(size(x));

% Plot input and output
figure;
subplot(2,1,1);
plot(t, x);
title('Input Signal (Noisy)');
xlabel('Time (s)');
ylabel('Amplitude');

% Apply the high-pass filter difference equation
for n = 2:length(x)
    y(n) = -beta * y(n-1) + alpha * (x(n) - x(n-1));
end

subplot(2,1,2);
plot(t, y);
title('Filtered Output (High-Pass)');
xlabel('Time (s)');
ylabel('Amplitude');

% Compute the FFT
xf = fft(x);
xfShifted = fftshift(xf);
L = length(t);

% Create a frequency vector for plotting
%  A range of indices centered around 0:
f = Fs*(-L/2:L/2-1)/L;
MAX_FREQ = 35e3;

% Create a figure to plot the FFT
figure;
subplot(2,1,1)
plot(f, abs(xfShifted)); % Plot the magnitude of the FFT
xlabel('Frequency Index');
ylabel('FFT of x(t)');
title('FFT of x(t)');
grid on; % Optional: add grid for better readability
xlim([-MAX_FREQ, MAX_FREQ])

yf = fft(y);
yfShifted = fftshift(yf);

% Create a figure to plot the FFT

subplot(2,1,2)
plot(f, abs(yfShifted)); % Plot the magnitude of the FFT
xlabel('Frequency Index');
ylabel('FFT of y(t)');
title('FFT of y(t)');
grid on; % Optional: add grid for better readability
xlim([-MAX_FREQ, MAX_FREQ])
