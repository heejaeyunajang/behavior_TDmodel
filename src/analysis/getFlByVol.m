function volF = getFlByVol(pdata, bdata, block)
% pdata: event-aligned photometry signals (array)
% bdata: trial info (table)
% block: 1 ('mixed') / 2 ('high') / 3 ('low') (string or double)

if size(pdata,1) ~= size(bdata,1)
    error('number of trials do not match')
end

T = linspace(-5, 10, size(pdata, 2)-1);

if strcmpi(block, 'mixed')
    block=1;
elseif strcmpi(block, 'high')
    block=2;
elseif strcmpi(block, 'low')
    block=3;
end

bdata.Reward = convertreward(bdata.Reward); % convert reward from uL to nominal

volF = cell(1,5);

for rew = 1:5
    F = getTrialsByVol(pdata, bdata, rew, block);
    volF{rew} = blsubtract(T, 0.1, 0, F);
end

end


