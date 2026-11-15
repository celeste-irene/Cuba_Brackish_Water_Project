
clc;
clear;
close all;

%% 1. Select Excel file

[file, folder] = uigetfile('*.xlsx', ...
    'Select Groundwater Excel File');

if isequal(file, 0)
    return
end

filename = fullfile(folder, file);

%% 2. Read the Excel data

sheets = sheetnames(filename);
data = readcell(filename, 'Sheet', sheets(1));

%% 3. Find arsenic row

labels = string(data(:,1));

arsenicRow = find(strcmpi(strtrim(labels), 'Arsenic'), 1);

if isempty(arsenicRow)
    error('Arsenic row not found in the spreadsheet.');
end

%% 4. Convert arsenic measurements to numbers

values = nan(1, size(data,2));

for k = 1:size(data,2)

    x = data{arsenicRow,k};

    if isnumeric(x) && isscalar(x) && isfinite(x)
        values(k) = x;
    end

end

% Check measurement units
units = strtrim(string(data{arsenicRow,2}));

if strcmpi(units, 'ug/L') || strcmpi(units, 'µg/L')
    values = values / 1000;
elseif ~strcmpi(units, 'mg/L')
    error('Check arsenic units in column 2: %s', units);
end

%% 5. Identify the four groundwater well groups

% Approximate column ranges from the spreadsheet

wellColumns = {
    5:20
    45:65
    90:110
    135:155
};

%% 6. Create the graph

% White outer background
figure('Color', 'w', 'Position', [100 100 1100 650]);

% Black plotting area
ax = gca;
ax.Color = 'k';

hold on;

% Plot the four wells
for i = 1:4

    cols = wellColumns{i};

    % Make sure columns exist
    cols = cols(cols <= length(values));

    % Extract arsenic measurements
    y = values(cols);

    % Remove missing measurements
    y = y(~isnan(y));

    % Sampling number
    x = 1:length(y);

    % Plot each well
    plot(x, y, '-o', ...
        'LineWidth', 2, ...
        'MarkerSize', 6, ...
        'DisplayName', ['Well ', num2str(i)]);

end

%% 7. Add EPA arsenic benchmark

epaLimit = 0.010;

yline(epaLimit, 'r--', ...
    'LineWidth', 2.5, ...
    'DisplayName', 'EPA Limit (0.010 mg/L)');

%% 8. Format the graph

set(gcf, 'Color', 'w');
set(gca, 'Color', 'k');

% Black axis numbers and tick marks
set(gca, 'XColor', 'k', 'YColor', 'k');

% Axis labels
xlabel('Sampling Number', ...
    'FontSize', 12, 'Color', 'k');

ylabel('Arsenic Concentration (mg/L)', ...
    'FontSize', 12, 'Color', 'k');

% Graph title
title('Arsenic Concentrations in Four Groundwater Wells', ...
    'FontSize', 14, 'Color', 'k');

% Legend
lgd = legend('Location', 'northeast');
lgd.Color = 'w';
lgd.TextColor = 'k';
lgd.EdgeColor = 'k';

% Axis limits
allValues = values([wellColumns{:}]);
allValues = allValues(~isnan(allValues));

if isempty(allValues)
    ylim([0 epaLimit*1.2]);
else
    ylim([0 max([allValues, epaLimit])*1.2]);
end

% Grid settings
grid on;
box on;
set(gca, 'FontSize', 11);
set(gca, 'GridColor', [0.65 0.65 0.65]);
set(gca, 'GridAlpha', 0.4);

hold off;

%% 9. Save the graph

[saveFile, saveFolder] = uiputfile('*.png', ...
    'Save Arsenic Graph As', ...
    'Arsenic_Groundwater_Graph.png');

if ~isequal(saveFile, 0)

    outputFile = fullfile(saveFolder, saveFile);

    exportgraphics(gcf, outputFile, ...
        'Resolution', 300);

    disp(['Graph saved to: ', outputFile]);

end

%% 10. Save and display arsenic statistics

[resultsFile, resultsFolder] = uiputfile('*.txt', ...
    'Save Arsenic Results As', ...
    'Arsenic_Results.txt');

if isequal(resultsFile, 0)
    fid = -1;
else
    fid = fopen(fullfile(resultsFolder, resultsFile), 'w');
end

fprintf('\nARSENIC CONCENTRATION RESULTS\n');

if fid ~= -1
    fprintf(fid, 'ARSENIC CONCENTRATION RESULTS\n');
end

for i = 1:4

    cols = wellColumns{i};
    cols = cols(cols <= length(values));

    y = values(cols);
    y = y(~isnan(y));

    if ~isempty(y)

        result = sprintf([ ...
            '\nWell %d:\n' ...
            'Number of measurements: %d\n' ...
            'Average arsenic: %.5f mg/L\n' ...
            'Minimum arsenic: %.5f mg/L\n' ...
            'Maximum arsenic: %.5f mg/L\n'], ...
            i, length(y), mean(y), min(y), max(y));

        if any(y > epaLimit)
            result = [result, ...
                sprintf('EPA benchmark exceeded.\n')];
        else
            result = [result, ...
                sprintf('All plotted measurements at or below EPA benchmark.\n')];
        end

        fprintf('%s', result);

        if fid ~= -1
            fprintf(fid, '%s', result);
        end

    else
        fprintf('Well %d: No numeric measurements found.\n', i);

        if fid ~= -1
            fprintf(fid, 'Well %d: No numeric measurements found.\n', i);
        end
    end

end

if fid ~= -1
    fclose(fid);
    disp('Arsenic results saved successfully.');
end
