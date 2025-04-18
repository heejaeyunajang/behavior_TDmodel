function [modelITI, modelValue, modelITI_] = simulateTD(ratTrial)

% Simulate trial initiation time with a vanilla TD model
alpha = 0.6; % learning rate
[modelITI_, ~, modelValue_, ~] = generateITI_vanillaTD(alpha, ratTrial);

% Exclude violation trials
modelValue = modelValue_(ratTrial.vios~=1);
modelITI = modelITI_(ratTrial.vios~=1);

% fill in NaNs with a moving average filter
modelValue = fillmissing(modelValue, 'movmean', 5);
modelITI = fillmissing(modelITI, 'movmean', 5);

end