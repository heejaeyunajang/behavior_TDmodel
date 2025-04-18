function plotModelRPEbyReward(ratTrial, RPE, mycolors)

ratTrial.reward = convertreward(ratTrial.reward);
if length(ratTrial.reward) ~= length(RPE)
    error('number of trials do not match');
end

RPEavg_vol = arrayfun(@(rew) ...
    mean(RPE(ratTrial.vios~=1 & ratTrial.reward==rew & ratTrial.block==1), ...
    'omitnan'), 1:5);

hold on;
arrayfun(@(x,y) plot(x,y,'o', 'Color', mycolors{x}, ...
    'MarkerFaceColor', mycolors{x}), 1:5, RPEavg_vol);

xlim([0 6]); ylim([-30 60]); yline(0, 'k--')
xlabel('Offered reward (uL)')
ylabel('Average RPE')
set(gca, 'FontSize', 11, 'TickDir', 'out', 'Box', 'off', ...
    'XTick', 1:5, 'XTickLabel', {'5','10','20','40','80'}, ...
    'YTick', [0 50])
subtitle('Model')

end
