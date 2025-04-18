function AUC = getAUC(pstruct, bstruct, event, block, reward, twin)
% pstruct: event-aligned photometry signal for all events (struct)
% bstruct: trial info table for all events (struct)
% event: name of task event ('CPOn', 'CPIn', 'SideOn', 'SideOff', 'Reward',
% 'OptOut')
% reward: nominal reward value (1,2,3,4,5)
% twin: time window to compute AUC in seconds (1x2 array)

if nargin<6
    twin = [0 0.5];
end

event = parseEvent(event);

pdata = pstruct.(event);
bdata = bstruct.(event);
p_block = getFlByVol(pdata, bdata, block);
p_block_vol = p_block{reward};

T = linspace(-5, 10, size(pdata, 2));
[~ , t1] = min(abs(T-twin(1)));
[~ , t2] = min(abs(T-twin(2)));
AUC = trapz(T(t1:t2), p_block_vol(:,t1:t2), 2);


end