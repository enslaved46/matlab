% Define parameters
Fs = 1000; % Sampling frequency in Hz
t = 0:1/Fs:1-1/Fs; % Time vector for 1 second

% Create two signals
signal1 = sin(2*pi*50*t); % 50 Hz sine wave
signal2 = cos(2*pi*120*t); % 120 Hz cosine wave

% Multiply the two signals
multiplied_signal = signal1 .* signal2;

% Compute the FFT of the multiplied signal
N = length(multiplied_signal); % Length of the signal
Y = fft(multiplied_signal); % Compute FFT
Y = Y(1:N/2+1); % Take the positive frequencies
P2 = abs(Y/N); % Two-sided spectrum
P1 = P2; % Initialize single-sided spectrum
P1(2:end-1) = 2*P2(2:end-1); % Convert to single-sided spectrum

% Define frequency domain
f = Fs*(0:(N/2))/N; % Frequency vector

% Plot the original signals and the FFT result
figure;

% Plot the multiplied signal
subplot(3, 1, 1);
plot(t, multiplied_signal);
title('Multiplied Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot the FFT result
subplot(3, 1, 2);
plot(f, P1);
title('Single-Sided Amplitude Spectrum of Multiplied Signal');
xlabel('Frequency (Hz)');
ylabel('|P1(f)|');
grid on;

% Plot the individual signals
subplot(3, 1, 3);
hold on;
plot(t, signal1, 'r', 'DisplayName', 'Signal 1 (50 Hz)');
plot(t, signal2, 'b', 'DisplayName', 'Signal 2 (120 Hz)');
title('Original Signals');
xlabel('Time (s)');
ylabel('Amplitude');
legend show;
grid on;

% Add a common title for the entire figure
sgtitle('FFT of Multiplied Signals');
