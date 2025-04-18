function [modelITI, RPE, Kappa, Rewards] =...
    generateITI_vanillaTD(alpha, ratTrial)

%% Pull Data from Rat Trial
isgood = ~isnan(ratTrial.ITI);
% Pull rewards for good trials
[~,ratTrial.reward] = convertreward(ratTrial.reward); % convert reward to uL
rew_vector = ratTrial.reward(isgood);

% Find when the rat starts a new sessions - restarts beliefs etc.
newday = nan(1, length(ratTrial.ITI));
ntrials = [0; cumsum(ratTrial.ntrials)];

for ii = 1:length(ntrials)-1
    newday(ntrials(ii)+1:ntrials(ii+1)) = ii;
end

NewSessIdx = [1, find(diff(newday(isgood))) + 1];

%% Calculating Belief

% Initalize vectors
kappa = nan(length(rew_vector), 1);
rpe = nan(length(rew_vector), 1);

kappa_initial = 1; % set initial kappa value
% run a first pass to determine the initial values of kappa
for rr = 1:length(rew_vector)-1
    % restart for new session
    if ismember(rr, NewSessIdx)
        kappa(rr) = kappa_initial;
    end
    rpe(rr) = rew_vector(rr) - kappa(rr);
    kappa(rr+1) = kappa(rr) + alpha * rpe(rr);
end

% now, use the distribution of kappa values to choose a reasonable initial
% condition. Then rerun to get the new kappa and rpe
kappa_initial = median(kappa); 
kappa = nan(length(rew_vector), 1);
rpe = nan(length(rew_vector), 1);
for rr = 1:length(rew_vector)-1
    % restart for new session
    if ismember(rr, NewSessIdx)
        kappa(rr) = kappa_initial;
    end
    rpe(rr) = rew_vector(rr) - kappa(rr);
    kappa(rr+1) = kappa(rr) + alpha * rpe(rr);
end

%% Calculating ITI
% Model ITI as inversely proportional to value of the environment

iti_td = prctile(ratTrial.ITI, 90) - 0.1*kappa;
modelITI = nan(length(ratTrial.reward), 1);
modelITI(isgood) = iti_td;

RPE = nan(length(ratTrial.reward), 1);
RPE(isgood) = rpe;

Kappa = nan(size(ratTrial.reward));
Kappa(isgood) = kappa;

Rewards = nan(size(ratTrial.reward));
Rewards(isgood) = rew_vector;
end