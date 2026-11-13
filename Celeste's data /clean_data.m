%% Purpose of Data cleaning and Analysis: 
% Analyze and compare the Drainage/Discharge levels from Rio Puerco aquifer to how
% fast water is flowing/pumped. The main reason is to analyze water levels
% for safe consumption and to interact well with droughts, dry weather, and
% fracking with the Aquifer.



clear;
clc;
close all;

%% STEP 1: IMPORT CSV FILES

% Replace these with your actual CSV filenames
dischargeData = readtable('field-measurements.csv');
channelData = readtable('channel-measurements.csv');


%% STEP 2: CLEAN DISCHARGE DATA

% Convert discharge values to numeric
Q = str2double(string(dischargeData.value));

% Extract date information
yr = str2double(string(dischargeData.year));
mo = str2double(string(dischargeData.month));
dy = str2double(string(dischargeData.day));

% Identify valid dates
validDate = isfinite(yr) & isfinite(mo) & isfinite(dy) & ...
            mo >= 1 & mo <= 12 & dy >= 1 & dy <= 31 & ...
            yr >= 1900;

% Identify valid discharge measurements
validQ = isfinite(Q) & Q >= 0;

% Keep only valid rows
keepD = validDate & validQ;

% Create cleaned discharge table
D = table( ...
    string(dischargeData.field_visit_id(keepD)), ...
    datetime(yr(keepD), mo(keepD), dy(keepD)), ...
    Q(keepD), ...
    'VariableNames', ...
    {'field_visit_id','visit_date','discharge'});


%% STEP 3: CLEAN CHANNEL DATA

% Convert channel velocity to numeric
velocity = str2double(string(channelData.channel_velocity));

% Extract dates from channel time column
channelDateText = extractBefore(string(channelData.time), " ");

channelDates = datetime(channelDateText, ...
    'InputFormat', 'yyyy-MM-dd');

% Remove missing, non-numeric, zero, and negative velocities
keepC = ~isnat(channelDates) & ...
        isfinite(velocity) & velocity > 0;

% Create cleaned channel table
C = table( ...
    string(channelData.field_visit_id(keepC)), ...
    channelDates(keepC), ...
    velocity(keepC), ...
    'VariableNames', ...
    {'field_visit_id','visit_date','velocity'});


%% STEP 4: MATCH THE TWO DATASETS

% Match by field visit ID and date
combinedData = innerjoin(D, C, ...
    'Keys', {'field_visit_id','visit_date'});

% Display number of matched measurements
fprintf('Matched measurements: %d\n', height(combinedData));


%% STEP 5: FILTER DATA TO 2010-2026

startDate = datetime(2010,1,1);
endDate = datetime(2026,12,31);

% Filter discharge data
D_filtered = D( ...
    D.visit_date >= startDate & ...
    D.visit_date <= endDate, :);

% Sort discharge data chronologically
D_filtered = sortrows(D_filtered, 'visit_date');

% Filter matched channel and discharge data
data_filtered = combinedData( ...
    combinedData.visit_date >= startDate & ...
    combinedData.visit_date <= endDate, :);

% Display number of measurements after filtering
fprintf('Discharge measurements (2010-2026): %d\n', ...
    height(D_filtered));

fprintf('Matched velocity measurements (2010-2026): %d\n', ...
    height(data_filtered));


%% STEP 6: GRAPH 1 - DISCHARGE OVER TIME

figure;

scatter(D_filtered.visit_date, ...
    D_filtered.discharge, ...
    55, 'filled');

xlabel('Year');
ylabel('Discharge (ft^3/s)');

title('Rio Puerco Discharge Over Time (2010-2026)');

xlim([startDate endDate]);

grid on;
box on;

set(gca, 'FontSize', 12);
xtickformat('yyyy');





%% STEP 7: GRAPH 2 - CHANNEL VELOCITY VS. DISCHARGE

% Add year information
data_filtered.year = year(data_filtered.visit_date);
D_filtered.year = year(D_filtered.visit_date);

% Get discharge and velocity values
x = data_filtered.discharge;
y = data_filtered.velocity;
yr = data_filtered.year;

% Remove invalid values
valid = isfinite(x) & isfinite(y) & isfinite(yr) & ...
        x >= 0 & y > 0;

x_valid = x(valid);
y_valid = y(valid);
yr_valid = yr(valid);

% Identify measurements with zero discharge
zeroFlow = isfinite(D_filtered.discharge) & ...
           D_filtered.discharge == 0 & ...
           ~isnat(D_filtered.visit_date);

yr_zero = D_filtered.year(zeroFlow);
zeroYears = unique(yr_zero);

% Create figure
figure;
scatter(x_valid, y_valid, 65, 'filled');
hold on;

% Label each data point with its year
for i = 1:length(x_valid)
    text(x_valid(i), y_valid(i), ...
         ['  ' num2str(yr_valid(i))], ...
         'FontSize', 10, ...
         'VerticalAlignment', 'bottom');
end

% Add a trendline if there are enough distinct discharge values
if length(x_valid) >= 2 && length(unique(x_valid)) >= 2
    p = polyfit(x_valid, y_valid, 1);
    x_fit = linspace(min(x_valid), max(x_valid), 100);
    y_fit = polyval(p, x_fit);

   plot(x_fit, y_fit, '--', ...
     'Color', [0.4 0.7 1], ...
     'LineWidth', 2);
end

% Create box listing years with zero discharge
if ~isempty(zeroYears)
    yearList = sprintf('%d\n', zeroYears);
    zeroText = sprintf('YEARS WITH ZERO DISCHARGE\n%s', ...
                       strtrim(yearList));
else
    zeroText = 'YEARS WITH ZERO DISCHARGE\nNone';
end

% Place box in upper-left corner
text(0.03, 0.97, zeroText, ...
     'Units', 'normalized', ...
     'HorizontalAlignment', 'left', ...
     'VerticalAlignment', 'top', ...
     'FontSize', 10, ...
     'FontWeight', 'bold', ...
     'Color', 'k', ...
     'BackgroundColor', 'white', ...
     'EdgeColor', 'black', ...
     'Margin', 6);

% Label axes and title
xlabel('Discharge (ft^3/s)', 'FontSize', 12);
ylabel('Channel Velocity (ft/s)', 'FontSize', 12);
title('Channel Velocity vs. Discharge (2010-2026)');

grid on;
box on;
set(gca, 'FontSize', 12);

hold off;
