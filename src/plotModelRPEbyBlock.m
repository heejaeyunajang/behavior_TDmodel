function plotModelRPEbyBlock(ratTrial, RPE, mycolors)

ratTrial.reward = convertreward(ratTrial.reward);
if length(ratTrial.reward) ~= length(RPE)
    error('number of trials do not match');
end

hold on
rpe_block = arrayfun(@(bl) ...
    mean(RPE(ratTrial.vios~=1 & ratTrial.reward==3 & ratTrial.block==bl), ...
    'omitnan'), [3 1 2]);

arrayfun(@(x,y) plot(x, y, 'o', 'Color', mycolors{x}, ...
    'MarkerFaceColor', mycolors{x}), 1:3, rpe_block);

xlim([0.75, 3.25]); yline(0, 'k--')
xlabel('Block type')
ylabel('Average RPE')
xticks([])  
subtitle('Model')
set(gca, 'FontSize', 11, 'TickDir', 'out', 'Box', 'off', ...
    'XTick', 1:3, 'XTickLabel', {'Low', 'Mixed', 'High'})
end
