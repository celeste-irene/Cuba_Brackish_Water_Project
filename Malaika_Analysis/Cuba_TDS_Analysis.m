
clc;
clear;
close all;

%% 1. Select CSV file

[file, folder] = uigetfile('*.csv', ...
    'Select Cuba Groundwater TDS CSV File');

if isequal(file, 0)
    return
end

filename = fullfile(folder, file);

%% 2. Read the CSV data

data = readtable(filename);

%% 3. Get TDS measurements and well information

tds = data.TDS_mgL;

wellNames = string(data.unique_site_ID);

distance = data.DistanceFromCuba_miles;

% Remove missing measurements

valid = isfinite(tds) & tds >= 0 & isfinite(distance);

tds = tds(valid);
wellNames = wellNames(valid);
distance = distance(valid);

if isempty(tds)
    error('No valid TDS measurements found.');
end

%% 4. Sort samples by distance from Cuba

[distance, order] = sort(distance);

tds = tds(order);
wellNames = wellNames(order);

%% 5. Classify groundwater

fresh = tds < 1000;

brackish = tds >= 1000 & tds <= 10000;

highTDS = tds > 10000;

%% 6. Create the graph

figure('Color', 'w', ...
    'Position', [100 100 1250 750]);

ax = axes;

ax.Color = 'k';

hold on;

% Horizontal bars

b = barh(tds, 'FaceColor', 'flat');

% Set bar colors

for i = 1:length(tds)

    if fresh(i)
        b.CData(i,:) = [0.2 0.7 0.9];

    elseif brackish(i)
        b.CData(i,:) = [0.2 0.8 0.4];

    else
        b.CData(i,:) = [1 0.4 0.3];

    end

end

%% 7. Add brackish groundwater limits

xline(1000, 'y--', 'LineWidth', 2);

xline(10000, 'm--', 'LineWidth', 2);

%% 8. Format the graph

% Black graph, white outer background

set(gcf, 'Color', 'w');
set(gca, 'Color', 'k');

% Black axis labels and numbers on white background

set(gca, 'XColor', 'k', 'YColor', 'k');

xlabel('TDS Concentration (mg/L)', ...
    'FontSize', 12, 'Color', 'k');

ylabel('Groundwater Sample', ...
    'FontSize', 12, 'Color', 'k');

title('TDS Concentrations Within 30 Miles of Cuba, NM', ...
    'FontSize', 15, 'Color', 'k');

% Show well IDs

yticks(1:length(tds));

yticklabels(wellNames);

% Closest well at top

set(gca, 'YDir', 'reverse');

% Axis limits

xlim([0 max(12000, max(tds)*1.1)]);

% Grid

grid on;
box on;

set(gca, 'FontSize', 11);

set(gca, 'GridColor', [0.65 0.65 0.65]);

set(gca, 'GridAlpha', 0.4);

% Leave room for labels and legend

ax.Position = [0.25 0.24 0.68 0.60];

%% 9. Add legend (key)

% Invisible bars used only for legend

h1 = barh(nan, nan, ...
    'FaceColor', [0.2 0.7 0.9]);

h2 = barh(nan, nan, ...
    'FaceColor', [0.2 0.8 0.4]);

h3 = barh(nan, nan, ...
    'FaceColor', [1 0.4 0.3]);

% Invisible lines used only for legend

h4 = plot(nan, nan, 'y--', ...
    'LineWidth', 2);

h5 = plot(nan, nan, 'm--', ...
    'LineWidth', 2);

lgd = legend([h1 h2 h3 h4 h5], ...
    'Below 1000 mg/L', ...
    'Brackish (1000-10000 mg/L)', ...
    'Above 10000 mg/L', ...
    'Lower brackish limit', ...
    'Upper brackish limit', ...
    'Location', 'southoutside', ...
    'Orientation', 'horizontal');

lgd.Color = 'w';
lgd.TextColor = 'k';
lgd.EdgeColor = 'k';
lgd.FontSize = 9;

hold off;

%% 10. Save the graph

[saveFile, saveFolder] = uiputfile('*.png', ...
    'Save TDS Graph As', ...
    'Cuba_TDS_Groundwater_Graph.png');

if ~isequal(saveFile, 0)

    outputFile = fullfile(saveFolder, saveFile);

    exportgraphics(gcf, outputFile, ...
        'Resolution', 300);

    disp(['Graph saved to: ', outputFile]);

end

%% 11. Display TDS statistics

resultsFile = fullfile(folder, 'TDS_Results.txt');

diary(resultsFile)

fprintf('\nTDS CONCENTRATION RESULTS\n');
fprintf('------------------------------------\n');

fprintf('Groundwater samples within 30 miles of Cuba, NM\n');
fprintf('Produced-water records excluded.\n');

fprintf('\nNumber of samples: %d\n', length(tds));

fprintf('Average TDS: %.2f mg/L\n', mean(tds));

fprintf('Minimum TDS: %.2f mg/L\n', min(tds));

fprintf('Maximum TDS: %.2f mg/L\n', max(tds));

%% 12. Groundwater classification

fprintf('\nGROUNDWATER CLASSIFICATION\n');

fprintf('Below 1000 mg/L: %d samples\n', sum(fresh));

fprintf('Brackish (1000-10000 mg/L): %d samples\n', ...
    sum(brackish));

fprintf('Above 10000 mg/L: %d samples\n', sum(highTDS));

%% 13. Individual sample results

fprintf('\nINDIVIDUAL SAMPLE RESULTS\n');

for i = 1:length(tds)

    fprintf('\nSample %d:\n', i);

    fprintf('Well ID: %s\n', wellNames(i));

    fprintf('Distance from Cuba: %.2f miles\n', distance(i));

    fprintf('TDS concentration: %.2f mg/L\n', tds(i));

    if fresh(i)

        fprintf('Classification: Below brackish range\n');

    elseif brackish(i)

        fprintf('Classification: Brackish groundwater\n');

    else

        fprintf('Classification: Above brackish range\n');

    end

end

diary off

disp(['Results saved to: ', resultsFile]);
