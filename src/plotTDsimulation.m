function plotTDsimulation(modelITI, modelValue)

blkLength = 40; % each block is 40 trials

% Set plotting parameters
yl = [0 90];
cl = struct( ...
    'low', [0 0 1], ...
    'mixed', [0.41 0.1 0.81], ...
    'high', [1 0 0]);

% Define block sequence
conditions = {'mixed', 'low', 'mixed', 'high'};

% Plot shaded blocks
for i = 1:length(conditions)
    x = [(i-1)*blkLength, i*blkLength, i*blkLength, (i-1)*blkLength];
    y = [yl(1), yl(1), yl(2), yl(2)];
    fill(x, y, cl.(conditions{i}), 'FaceAlpha', 0.15, 'EdgeColor', 'none');
    hold on
end

% Plot model value 
yyaxis left
plot(modelValue(1:blkLength*4), '-', color='k', linewidth=0.5); hold on
xlim([blkLength blkLength*4])
for blk = 1:length(conditions)
    idx = (blkLength*(blk-1)+1):(blkLength*blk);
    avgValue = mean(modelValue(idx));
    plot([idx(1), idx(end)], [avgValue, avgValue], 'k-', 'LineWidth', 1.5);
end
ylim(yl)
yticks([])
xticks([])
ylabel('Value')

% Plot model ITI
yyaxis right
ax = gca;
ax.YColor = [0.7 0.7 0.7];
plot(modelITI(1:blkLength*4), '-', 'color', [0 0 0 0.25], 'linewidth', 0.5);
hold on
for blk = 1:length(conditions)
    idx = (blkLength*(blk-1)+1):(blkLength*blk);
    avgITI = mean(modelITI(idx));
    plot([idx(1), idx(end)], [avgITI, avgITI], '-', ...
        'color', [0 0 0 0.25], 'LineWidth', 1.5);
end
yticks([])
xlabel('Trial')
ylabel('Time to initiate trial', rotation=270, VerticalAlignment='bottom')

set(gca, tickdir='out', box='off');

end