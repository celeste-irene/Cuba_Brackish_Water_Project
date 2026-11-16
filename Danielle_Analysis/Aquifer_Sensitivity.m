
clear;
clc;
close all;

% Read the CSV file
data = readtable('Aquifer_Sensitivity.csv');

% Count sensitivity categories
less = sum(strcmpi(string(data.SENSITIVITY), 'Less'));
moderate = sum(strcmpi(string(data.SENSITIVITY), 'Mod'));
high = sum(strcmpi(string(data.SENSITIVITY), 'High'));

counts = [less, moderate, high];
categories = {'Less', 'Moderate', 'High'};

% Calculate percentages
total = height(data);
percentages = counts / total * 100;

% Create graph
figure('Color', 'k');

b = bar(counts, 0.6);
b.FaceColor = 'flat';

% Green, yellow, red
b.CData = [0.2 0.7 0.3;
    0.95 0.7 0.2;
    0.85 0.2 0.2];

ax = gca;
ax.Color = 'k';
ax.XColor = 'w';
ax.YColor = 'w';
ax.FontSize = 12;

xticks(1:3);
xticklabels(categories);

xlabel('Aquifer Sensitivity', 'Color', 'w');
ylabel('Number of Mapped Areas', 'Color', 'w');
title('Aquifer Sensitivity in New Mexico', 'Color', 'w');

% Add counts above bars
for i = 1:length(counts)
    text(i, counts(i) + 5, num2str(counts(i)), ...
        'HorizontalAlignment', 'center', ...
        'Color', 'w', 'FontSize', 12);
end

ylim([0 max(counts) + 50]);
grid on;

% Save graph automatically
exportgraphics(gcf, 'Aquifer_Sensitivity_Graph.png', ...
    'Resolution', 300);

% Save numerical results automatically
fileID = fopen('Aquifer_Sensitivity_Results.txt', 'w');

fprintf(fileID, 'Aquifer Sensitivity Analysis\n');
fprintf(fileID, 'New Mexico Environment Department\n\n');
fprintf(fileID, 'Total mapped areas: %d\n\n', total);

for i = 1:length(counts)
    fprintf(fileID, '%s Sensitivity:\n', categories{i});
    fprintf(fileID, 'Number of areas: %d\n', counts(i));
    fprintf(fileID, 'Percentage: %.2f%%\n\n', percentages(i));
end

fprintf(fileID, 'Note: Results describe mapped features, not individual wells.\n');
fprintf(fileID, 'These classifications do not measure actual contamination.\n');

fclose(fileID);

% Display results in Command Window
fprintf('Analysis complete!\n');
fprintf('Total mapped areas: %d\n', total);
fprintf('Graph saved: Aquifer_Sensitivity_Graph.png\n');
fprintf('Results saved: Aquifer_Sensitivity_Results.txt\n');
