function plotAUCbyReward(auc_vol, mycolors)

hold on
arrayfun(@(i) errorbar(i, ...
    mean(auc_vol{i}, 'omitnan'), ...
    sem(auc_vol{i}, 'omitnan'), ...
    '_', 'Color', mycolors{i}, 'LineWidth', 2, 'CapSize', 0), ...
    1:numel(auc_vol));

xlim([0.5, 5.5]); yline(0, 'k--')
xlabel('Offered reward (uL)')
ylabel('DA AUC')
subtitle('Rat')
set(gca, 'FontSize', 11, 'TickDir', 'out', 'Box', 'off', ...
    'XTick', 1:5, 'XTickLabel', {'5','10','20','40','80'})

end
