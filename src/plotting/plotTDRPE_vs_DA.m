function plotTDRPE_vs_DA(ratTrial, RPE, AUC_rew, AUC_block)

% plotting colors
% from small to big volumes
cl.reward = getcolors('volume');
% low, mixed, high order
cl.block = getcolors('block');

figure;
tiledlayout(1, 4, 'Padding', 'compact');
set(gcf, 'Units', 'inches', 'Position', [4.5, 5, 9.7, 2.6]);

nexttile(1); plotModelRPEbyReward(ratTrial, RPE, cl.reward);
nexttile(2); plotAUCbyReward(AUC_rew, cl.reward);
nexttile(3); plotModelRPEbyBlock(ratTrial, RPE, cl.block);
nexttile(4); plotAUCbyBlock(AUC_block, cl.block);

end