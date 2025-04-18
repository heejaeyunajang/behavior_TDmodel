function plotTDsequence(modelITI, modelValue)
% Plot trial-by-trial TD model value and ITI

blkLength = 40;
conditions = {'mixed', 'low', 'mixed', 'high'};
yl = [0 90];
cl = struct('low', [0 0 1], 'mixed', [0.41 0.1 0.81], 'high', [1 0 0]);

ax = axes('Position', [0.1, 0.15, 0.55, 0.7]); hold on;

% Shaded blocks
for i = 1:length(conditions)
    x = [(i-1)*blkLength, i*blkLength, i*blkLength, (i-1)*blkLength];
    y = [yl(1), yl(1), yl(2), yl(2)];
    fill(x, y, cl.(conditions{i}), 'FaceAlpha', 0.15, 'EdgeColor', 'none');
end

% Left y-axis: TD value
yyaxis left
plot(modelValue(1:blkLength*4), '-', 'Color', 'k', 'LineWidth', 0.5);
xlim([blkLength blkLength*4])
for blk = 1:length(conditions)
    idx = (blkLength*(blk-1)+1):(blkLength*blk);
    plot([idx(1), idx(end)], repmat(mean(modelValue(idx)), 1, 2), ...
         'k-', 'LineWidth', 1.5);
end
ylim(yl)
yticks([])
xticks([])
ylabel('Value')

% Right y-axis: ITI
yyaxis right
ax.YColor = [0.7 0.7 0.7];
plot(modelITI(1:blkLength*4), '-', 'Color', [0 0 0 0.25], 'LineWidth', 0.5);
for blk = 1:length(conditions)
    idx = (blkLength*(blk-1)+1):(blkLength*blk);
    plot([idx(1), idx(end)], repmat(mean(modelITI(idx)), 1, 2), ...
         '-', 'Color', [0 0 0 0.25], 'LineWidth', 1.5);
end
yticks([])
xlabel('Trial')
ylabel('Time to initiate trial', 'Rotation', 270, 'VerticalAlignment', 'bottom')
set(gca, 'TickDir', 'out', 'Box', 'off');

end
