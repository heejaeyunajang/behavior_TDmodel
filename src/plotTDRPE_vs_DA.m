function plotTDRPE_vs_DA(ratTrial, RPE, AUC_rew, AUC_block)

% plotting colors
% from small to big volumes
cl.reward = {'#bb7af7', '#9a5bd0', '#793cab', '#591e86', '#390061'};
% low, mixed, high order
cl.block = {'b','#9933FF','r'}; 

figure;
tiledlayout(1, 4, 'Padding', 'compact');
set(gcf, 'Units', 'inches', 'Position', [4.5, 5, 9.7, 2.6]);

nexttile(1); plotModelRPEbyReward(ratTrial, RPE, cl.reward);
nexttile(2); plotAUCbyReward(AUC_rew, cl.reward);
nexttile(3); plotModelRPEbyBlock(ratTrial, RPE, cl.block);
nexttile(4); plotAUCbyBlock(AUC_block, cl.block);

end