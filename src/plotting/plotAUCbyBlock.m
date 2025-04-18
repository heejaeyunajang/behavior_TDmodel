function plotAUCbyBlock(auc_block, mycolors)

hold on
blockorder = [3, 1, 2];  % low, mixed, high
x_positions  = [1, 2, 3];  % desired x-axis locations

arrayfun(@(i) errorbar(x_positions(i), ...
    mean(auc_block{blockorder(i)}, 'omitnan'), ...
    sem(auc_block{blockorder(i)}, 'omitnan'), ...
    '_', 'Color', mycolors{i}, 'LineWidth', 2, 'CapSize', 0), ...
    1:length(blockorder));

xlim([0.5, 3.5]); yline(0, 'k--')
xlabel('Block type')
ylabel('DA AUC')
subtitle('Rat')
set(gca, 'FontSize', 11, 'TickDir', 'out', 'Box', 'off', ...
    'XTick', 1:3, 'XTickLabel', {'Low', 'Mixed', 'High'})

end
