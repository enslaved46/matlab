% HOW to calulate FFT
% Need to fix FFT part, polar form
clear ;
close all;
numberOfSamples = 100;
%equal spaced samples
%xt = zeros([1, numberOfSamples]);
%xt(1:10) = 1;

Fc = 10e4;
omega = 2* pi * Fc;
% Tau = RC, Fc = 1/WcRc
Tau = 1/(2*pi*Fc);

%sampling Period
Fs =  2*Fc ;                      % Sampling frequency (Hz)
Ts = 1/(Fc); 
t = 0:Ts:0.01;                 % Time vector (10 ms)


f1 = 100;
xt = sin(2*pi*f1*t) +sin(2*pi*2*f1*t) + cos(2*pi*3*f1*t) + sin(2*pi*4*f1*t) ;
N = 1001; % length(t); % Number of samples for FFT

figure
plot(xt);
xlabel("Sample Index");
ylabel("X(t)");
title("Plot of x(t)");
%% 
%% Note
% Input is real, we still get imaginary
%Just because the input is real we get real Fourse Transform real. 
%Due to Eular expression, 
%odd terms becomes IMG
%Even Tems becomes Real;
%e^-jtheta = cos(theta) + j sine(theta)

%cos is even term 
%sine is odd term
%% FFt
xf = fft(xt);

figure
plot(xf);
xlabel('Frequency Index');
ylabel('FFT of x(t)');
title('FFT of x(t)');
grid on;

%% Ploting real an IMG part
%% 0 to +Ve freq and start looking at -Ve Freq, will see aliasing here
% plotting in rectangualr form  form
%xf = fft(xt);
figure
subplot(2,1,1);
plot(real(xf))
xlabel('Frequency Index');
ylabel('Real part of FFT of x(t)');
title('Real partFFT of x(t)');
grid on;

subplot(2,1,2);
plot(imag(xf))
xlabel('Frequency Index');
ylabel('Imaginary part of FFT of x(t)');
title('Imaginary part of FFT of x(t)');
grid on;



%% 

% Do FFT Shift
%xf = fft(xt);
figure
subplot(4,1,1);
plot(real(fftshift(xf)))
xlabel('Frequency Index');
ylabel('Real part of FFT of x(t)');
title('Real part FFT of x(t) with FFT Shift ');
grid on;

subplot(4,1,2);
plot(imag(fftshift(xf)))
xlabel('Frequency Index');
ylabel('Imaginary part of FFT of x(t)');
title('Imaginary part of FFT of x(t) with FFT Shift');
grid on;

% Compute the magnitude and phase of the FFT
magnitudeXf = abs(xf);
phaseXf = angle(xf);

% Plotting the magnitude and phase of the FFT
subplot(4,1,3);
plot(fftshift(magnitudeXf));
xlabel('Frequency Index');
ylabel('Magnitude of FFT of x(t)');
title('Magnitude of FFT of x(t)');
grid on;

subplot(4,1,4);
plot(fftshift(phaseXf));
xlabel('Frequency Index');
ylabel('Phase of FFT of x(t)');
title('Phase of FFT of x(t)');
grid on;

figure

xt = sin(2*pi*f1*t) +sin(2*pi*2*f1*t) + cos(2*pi*3*f1*t) + sin(2*pi*4*f1*t) ;

% Compute the FFT

xf = fft(xt);
xfShifted = fftshift(xf);

% Create a frequency vector for plotting
%  A range of indices centered around 0:
f = Fs*(-N/2:N/2-1)/N;

plot(f, abs(xfShifted)); % Plot the magnitude of the FFT
xlabel('Frequency Index');
ylabel('FFT of x(t)');
title('FFT of x(t)');
grid on; % Optional: add grid for better readability