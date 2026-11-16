
clc;
clear;
close all;

%% 1. Select groundwater dataset

[file, path] = uigetfile('*.xlsx', 'Choose Excel File');

if isequal(file, 0)
    return
end

filename = fullfile(path, file);
data = readcell(filename);

%% 2. Find Total Dissolved Solids

parameters = string(data(:,1));

tdsRow = find(contains(parameters, ...
    'Solids, Filterable Total Dissolved Solids'), 1);

if isempty(tdsRow)
    error('TDS row not found.');
end

%% 3. Find the four well groups

headers = string(data(3,:));
wellStarts = zeros(1,4);

for i = 1:4
    wellStarts(i) = find(headers == "Well-" + i, 1);
end

%% 4. Calculate TDS statistics

avgTDS = zeros(1,4);
minTDS = zeros(1,4);
maxTDS = zeros(1,4);
numSamples = zeros(1,4);

for i = 1:4

    columns = wellStarts(i):2:wellStarts(i)+32;
    values = data(tdsRow, columns);

    numbers = nan(1,length(values));

    for j = 1:length(values)
        if isnumeric(values{j}) && ...
                isscalar(values{j}) && isfinite(values{j})
            numbers(j) = values{j};
        end
    end

    numbers = numbers(~isnan(numbers));

    numSamples(i) = length(numbers);

    if ~isempty(numbers)
        avgTDS(i) = mean(numbers);
        minTDS(i) = min(numbers);
        maxTDS(i) = max(numbers);
    else
        avgTDS(i) = NaN;
        minTDS(i) = NaN;
        maxTDS(i) = NaN;
    end

end

%% 5. Create bar chart

figure('Color','w','Position',[200 200 950 600]);

% Dark navy blue for labels
navy = [0.05 0.15 0.35];

% Bar colors
colors = [0.22 0.55 0.70;
          0.20 0.68 0.62;
          0.48 0.65 0.42;
          0.85 0.65 0.32];

b = bar(1:4, avgTDS, 0.6, 'FaceColor','flat');
b.CData = colors;

hold on;

% Black plotting area
ax = gca;
ax.Color = 'k';

%% 6. Add brackish water reference

yline(1000, '--', '1000 mg/L', ...
    'Color',[0.9 0.3 0.3], ...
    'LineWidth',1.5, ...
    'FontSize',11);

%% 7. Format the graph

xticks(1:4);
xticklabels({'Well 1','Well 2','Well 3','Well 4'});

% Dark blue axis labels and numbers
set(gca, 'XColor', navy, 'YColor', navy);

xlabel('Groundwater Well Group', ...
    'FontSize',13, ...
    'FontWeight','bold', ...
    'Color',navy);

ylabel('Average TDS (mg/L)', ...
    'FontSize',13, ...
    'FontWeight','bold', ...
    'Color',navy);

title('Groundwater Salinity Comparison', ...
    'FontSize',17, ...
    'FontWeight','bold', ...
    'Color',navy);

subtitle('Total Dissolved Solids in Four Well Groups', ...
    'FontSize',12, ...
    'Color',navy);

% Display values above bars
for i = 1:4

    text(i, avgTDS(i)+120, ...
        sprintf('%.0f',avgTDS(i)), ...
        'HorizontalAlignment','center', ...
        'FontSize',12, ...
        'FontWeight','bold', ...
        'Color','w');

end

ylim([0 max(avgTDS)*1.2]);

grid on;
box off;

set(gca, ...
    'FontSize',12, ...
    'GridColor',[0.6 0.6 0.6], ...
    'GridAlpha',0.3);

hold off;

%% 8. Save graph to computer

[saveFile, saveFolder] = uiputfile('*.png', ...
    'Save TDS Graph As', ...
    'TDS_Groundwater_Graph.png');

if ~isequal(saveFile, 0)

    outputFile = fullfile(saveFolder, saveFile);

    exportgraphics(gcf, outputFile, ...
        'Resolution',300);

    disp(['Graph saved to: ', outputFile]);

end

%% 9. Save statistical results to computer

[resultsFile, resultsFolder] = uiputfile('*.txt', ...
    'Save TDS Results As', ...
    'TDS_Results.txt');

if ~isequal(resultsFile, 0)

    resultsPath = fullfile(resultsFolder, resultsFile);

    fid = fopen(resultsPath, 'w');

    if fid == -1
        error('Could not create results file.');
    end

else
    fid = -1;
end

%% 10. Display and save statistics

fprintf('\nTOTAL DISSOLVED SOLIDS RESULTS\n');

if fid ~= -1
    fprintf(fid, 'TOTAL DISSOLVED SOLIDS RESULTS\n');
end

for i = 1:4

    result = sprintf([ ...
        '\nWell %d:\n' ...
        'Number of measurements: %d\n' ...
        'Average TDS: %.2f mg/L\n' ...
        'Minimum TDS: %.2f mg/L\n' ...
        'Maximum TDS: %.2f mg/L\n'], ...
        i, numSamples(i), avgTDS(i), ...
        minTDS(i), maxTDS(i));

    fprintf('%s', result);

    if fid ~= -1
        fprintf(fid, '%s', result);
    end

end

if fid ~= -1
    fclose(fid);
    disp(['Results saved to: ', resultsPath]);
end
