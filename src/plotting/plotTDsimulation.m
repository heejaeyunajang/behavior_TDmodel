function plotTDsimulation(modelITI, modelITI_all, modelValue, blocks)

figure('Units', 'Inches', 'Position', [8, 4.8, 5.7, 2.35]);

plotTDsequence(modelITI, modelValue);
plotITIbar(modelITI_all, blocks);

end