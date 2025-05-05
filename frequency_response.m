%% --- Time vector configuration ---
t_end = 10;         % <- Change this for different simulation end times
num_pts = 1001;     % <- Change this for different sampling resolutions

% Create time vector from 3 to t_end seconds
t = linspace(3, t_end, num_pts);

%% --- Plotting: Output voltage and duty cycle ---
figure;

% Left y-axis: output voltage
yyaxis left
plot(t, eo, 'b', 'LineWidth', 1.5);
ylabel('output voltage (Volts)');
ylim([1 3]);  % Optional: adjust as needed
set(gca, 'YColor', 'b');

% Right y-axis: duty cycle
yyaxis right
plot(t, dc, 'g', 'LineWidth', 1.5);
ylabel('duty cycle');
ylim([0 0.6]);  % Optional: adjust as needed
set(gca, 'YColor', 'g');

% Common x-axis and title
xlabel('time (sec)');
title('Boost Circuit Frequency Response (freq = 0.5 Hz)');
grid on;

%% --- Frequency and input amplitude setup ---
freq = 0.5;  % <- set this to your test frequency
A_input = 40 / 255;  % ~0.157

% Convert fixed-point (fi) to double if needed
if ~isa(dc, 'double')
    dc = double(dc);
end
if ~isa(eo, 'double')
    eo = double(eo);
end

% Define safe MinPeakDistance slightly less than one full period
peak_dist = 0.9 / freq;

%% --- Magnitude calculation using peak-valley pairs ---

% Find output voltage peaks
[eo_peaks, eo_peak_locs] = findpeaks(eo, t, 'MinPeakDistance', peak_dist);

% Find output voltage valleys (invert and find peaks)
[eo_valleys_inv, eo_valley_locs] = findpeaks(-eo, t, 'MinPeakDistance', peak_dist);
eo_valleys = -eo_valleys_inv;

% Match number of peaks and valleys
num_pairs = min(length(eo_peaks), length(eo_valleys));

% Compute local amplitude using matched peak-valley pairs
eo_amp = mean(eo_peaks(1:num_pairs) - eo_valleys(1:num_pairs)) / 2;

% Magnitude in dB
mag_dB = 20 * log10(eo_amp / A_input);

%% --- Improved Phase calculation using nearest output peaks after input peaks ---

% Find peaks in input duty cycle and output voltage
[dc_peaks, dc_locs] = findpeaks(dc, t, 'MinPeakDistance', peak_dist);
[eo_peaks, eo_locs] = findpeaks(eo, t, 'MinPeakDistance', peak_dist);

% Initialize array for time lags
time_lags = [];

for i = 1:length(dc_locs)
    % Find the first eo peak that occurs *after* this dc peak
    next_eo_idx = find(eo_locs > dc_locs(i), 1);
    if ~isempty(next_eo_idx)
        lag = eo_locs(next_eo_idx) - dc_locs(i);
        time_lags(end+1) = lag;
    end
end

% Compute average time lag and convert to phase
if ~isempty(time_lags)
    delta_t = mean(time_lags);
    phase_deg = -delta_t * freq * 360;  % Output lags input => negative phase
else
    warning('No matching output peaks found after input peaks!');
    phase_deg = NaN;
end

%% --- Display results ---
fprintf('Frequency = %.4f Hz\n', freq);
fprintf('Amplitude (output) = %.4f V\n', eo_amp);
fprintf('Magnitude = %.2f dB\n', mag_dB);
fprintf('Phase = %.2f degrees\n', phase_deg);