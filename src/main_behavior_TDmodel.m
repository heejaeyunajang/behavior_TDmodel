% Main script for simulating trial initiation time behavior with a vanilla
% TD algorithm in the Constantinople lab temporal wagering task

% Clear environment
clear; clc; close all

% define paths
gitdir = 'C:\Users\hjj296\Documents\GitHub'; % <-- CHANGE THIS TO YOUR LOCAL REPO PATH
bdatadir = fullfile(gitdir, 'temporalbandit_TDmodel', 'data');
ratname = 'J032';
bdatafile = fullfile(bdatadir, sprintf('ratTrial_%s.mat', ratname));
pdatafile = 'Z:\PhotometryData\GRAB_DA_DMS\J032_DA_ch1_aDMS_tmac.mat';

%% Load behavior and dopamine data
% Load behavior data of an example rat to simulate with (struct that
% concatenates all behavior sessions)
load(bdatafile, 'A');
ratTrial = A;
% Preprocess trial initiation time (removes outliers)
ratTrial.ITI = preprocessITI(ratTrial);

% Load dopamine data <-- UPDATE THIS AFTER UPLOADING DATA IN A PUBLIC SPACE
load(pdatafile, 'pstruct')
pstruct = pstruct.(ratname);
load(strrep(pdatafile, 'ch1_aDMS_tmac', 'bstruct'), 'bstruct')
bstruct = bstruct.(ratname);

%% compute dopamine AUC at Offer Cue (0~0.5s)

% get dopamine AUC in mixed block for different rewards
AUC_rew = cell(1,5);
for rew=1:5
    AUC_rew{rew} = getAUC(pstruct, bstruct, 'CPIn', 'mixed', rew, [0 0.5]);
end

% get dopamine AUC for 20uL rewards for different blocks
AUC_block = cell(1,3);
for blk=1:3
    AUC_block{blk} = getAUC(pstruct, bstruct, 'CPIn', blk, 3, [0 0.5]);
end


%% Run TD model simulation
% modelITI and modelValue excludes violation trials, and modelITI_all includes
% violation trials
[modelITI, modelITI_all, modelValue, RPE] = simulateTD(ratTrial);

%% Plot results

plotTDsimulation(modelITI, modelITI_all, modelValue, ratTrial.block);

