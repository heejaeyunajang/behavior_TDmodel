function plotITIbar(modelITI_all, blocks)
% Plot block-wise average ITI from model simulation

ax = axes('Position', [0.75, 0.15, 0.2, 0.7]); hold on;

% Define order: low = 3, mixed = 1, high = 2
ITI_by_block = [ ...
    mean(modelITI_all(blocks == 3), 'omitnan');  % Low
    mean(modelITI_all(blocks == 1), 'omitnan');  % Mixed
    mean(modelITI_all(blocks == 2), 'omitnan')   % High
];

plot(ITI_by_block, '.k', 'MarkerSize', 10);
xlim([0.5 3.5]);
yticks([]);
xlabel('Block type');
subtitle('Trial initiation time');
set(gca, 'TickDir', 'out', 'Box', 'off', ...
    'XTick', [1 2 3], 'XTickLabel', {'Low', 'Mixed', 'High'});

end
