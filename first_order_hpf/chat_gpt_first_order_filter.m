clear;
Fc = 10000;          % Cutoff frequency (Hz)
Fs = 200000;         % Sampling frequency (Hz)
Ts = 1/Fs;           % Sampling period
Tau = 1 / (2 * pi * Fc);  % Time constant for 1st-order filter

% Prewarp to match analog -3 dB point
K = 2 * Tau / Ts;
alpha = K / (1 + K);
beta  = (1 - K) / (1 + K);

% Time vector and test signal
t = 0:Ts:0.005;  % 5 ms of signal
x = sin(2*pi*1000*t) + sin(2*pi*30000*t);  % 1kHz + 30kHz components

% Filter output init
y = zeros(size(x));

% Difference equation for first-order HPF
for n = 2:length(x)
    y(n) = -beta * y(n-1) + alpha * (x(n) - x(n-1));
end

% Plot
figure;
subplot(2,1,1);
plot(t, x);
title('Input Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, y);
title('Filtered Output (1st Order HPF)');
xlabel('Time (s)');
ylabel('Amplitude');


% ==== FFT Parameters ====
L = length(x);              % Number of samples
f = Fs*(0:(L/2))/L;         % Frequency axis (Hz)

% FFT of input signal
Xf = fft(x);
P2x = abs(Xf / L);          % Normalize
P1x = P2x(1:L/2+1);         % Single-sided
P1x(2:end-1) = 2*P1x(2:end-1);  % Double amplitudes (except DC & Nyquist)

% FFT of filtered signal
Yf = fft(y);
P2y = abs(Yf / L);
P1y = P2y(1:L/2+1);
P1y(2:end-1) = 2*P1y(2:end-1);

% ==== Plot FFTs ====
figure;

subplot(2,1,1);
plot(f, P1x, 'b', 'LineWidth', 1.5);
title('Amplitude Spectrum of Input Signal');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
grid on;
xlim([0 50000]);

subplot(2,1,2);
plot(f, P1y, 'r', 'LineWidth', 1.5);
title('Amplitude Spectrum of Filtered Signal');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
grid on;
xlim([0 50000]);
