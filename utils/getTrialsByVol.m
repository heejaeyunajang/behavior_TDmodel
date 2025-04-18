function data = getTrialsByVol(pdata, bdata, reward, block, ...
    exclvio, exclpostvio)
% default is to include violation trials and exclude post-violation trials

if nargin<6
    exclpostvio = true;
    if nargin<5
        exclvio = false;
    end
end

all = bdata.Block == block & bdata.Reward == reward;

if ~exclpostvio && ~exclvio % use all trials
    these = find(all);
elseif ~exclpostvio && exclvio % exclude violations, include post-violations
    these = find(all & bdata.TrialType~=2);
elseif exclpostvio && ~exclvio % include violations, exclude post-violations (default)
    these = find(all & bdata.PrevTrialType~=2);
elseif exclpostvio && exclvio % exclude violations and post-violations
    these = find(all & bdata.PrevTrialType~=2 & bdata.TrialType~=2); 
end
data = pdata(these,:);

end
