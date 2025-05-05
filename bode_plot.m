% Replace these with your actual results
freq  = [0.0628 0.314 0.628 1.26 1.57 3.14 6.28 15.7 31.4];  % in rad/sec
mag   = [17.29 16.38 16.76 16.86 16.03 16.27 16.12 15.80 15.36];    % in dB
phase = [87.06 52.86 1.89 -24.42 -114.93 -128.66 -148.39 -201.71 -241.50];     % in degrees

% Create Bode plot (2 subplots)
figure;

% Magnitude plot
subplot(2,1,1);
semilogx(freq, mag, 'o-', 'LineWidth', 1.5);
grid on;
xlabel('Frequency (rad/sec)');
ylabel('Magnitude (dB)');
title('Boost Converter Empirical Bode Diagram');

% Phase plot
subplot(2,1,2);
semilogx(freq, phase, 's-', 'LineWidth', 1.5);
grid on;
xlabel('Frequency (rad/sec)');
ylabel('Phase (degrees)');