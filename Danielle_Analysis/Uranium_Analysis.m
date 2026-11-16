
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

%% 3. Find uranium row

labels = string(data(:,1));

uraniumRow = find(strcmpi(strtrim(labels), 'Uranium'), 1);

if isempty(uraniumRow)
    error('Uranium row not found in the spreadsheet.');
end

%% 4. Convert uranium measurements to numbers

values = nan(1, size(data,2));

for k = 1:size(data,2)

    x = data{uraniumRow,k};

    if isnumeric(x) && isscalar(x) && isfinite(x)
        values(k) = x;
    end

end

%% 5. Identify the four groundwater wells

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

    % Extract uranium measurements

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

%% 7. Add EPA uranium benchmark

epaLimit = 0.030;

yline(epaLimit, 'r--', ...
    'LineWidth', 2.5, ...
    'DisplayName', 'EPA Limit (0.030 mg/L)');

%% 8. Format the graph

% White outside and black inside

set(gcf, 'Color', 'w');

set(gca, 'Color', 'k');

% Black axis numbers and tick marks

set(gca, 'XColor', 'k', 'YColor', 'k');

% Axis labels

xlabel('Sampling Number', ...
    'FontSize', 12, 'Color', 'k');

ylabel('Uranium Concentration (mg/L)', ...
    'FontSize', 12, 'Color', 'k');

% Graph title

title('Uranium Concentrations in Four Groundwater Wells', ...
    'FontSize', 14, 'Color', 'k');

% Legend with white background and black text

lgd = legend('Location', 'northeast');

lgd.Color = 'w';

lgd.TextColor = 'k';

lgd.EdgeColor = 'k';

% Axis limits

ylim([0 0.035]);

% Grid settings for black background

grid on;

box on;

set(gca, 'FontSize', 11);

set(gca, 'GridColor', [0.65 0.65 0.65]);

set(gca, 'GridAlpha', 0.4);

hold off;

%% 9. Save the graph

[saveFile, saveFolder] = uiputfile('*.png', ...
    'Save Uranium Graph As', ...
    'Uranium_Groundwater_Graph.png');

if ~isequal(saveFile, 0)

    outputFile = fullfile(saveFolder, saveFile);

    exportgraphics(gcf, outputFile, ...
        'Resolution', 300);

    disp(['Graph saved to: ', outputFile]);

end

%% 10. Display uranium statistics

diary('Uranium_Results.txt')

fprintf('\nURANIUM CONCENTRATION RESULTS\n');

for i = 1:4

    cols = wellColumns{i};

    cols = cols(cols <= length(values));

    y = values(cols);

    y = y(~isnan(y));

    if ~isempty(y)

        fprintf('\nWell %d:\n', i);

        fprintf('Number of measurements: %d\n', length(y));

        fprintf('Average uranium: %.5f mg/L\n', mean(y));

        fprintf('Minimum uranium: %.5f mg/L\n', min(y));

        fprintf('Maximum uranium: %.5f mg/L\n', max(y));

        if any(y > epaLimit)

            fprintf('EPA benchmark exceeded.\n');

        else

            fprintf('All plotted measurements below EPA benchmark.\n');

        end

    end

end

diary off

