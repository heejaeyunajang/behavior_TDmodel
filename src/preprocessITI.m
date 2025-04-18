function iti = preprocessITI(A)
% Process trial initiation time data 

iti = A.ITI;
% Set trial initiation on first trial of each session to NaN
ctr = 1;
for jk = 1:length(A.ntrials)
    iti(ctr) = nan;
    ctr = ctr + A.ntrials(jk);
end

% remove outliers
thresh = [prctile(iti,1), prctile(iti,99)];
iti(iti<min(thresh) | iti>max(thresh)) = nan;

end