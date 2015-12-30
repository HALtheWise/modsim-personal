optimaltime = fminsearch(@coffee_runsim, 1*60);

fprintf('\nOptimal cream addition is at %f minutes\n', optimaltime / 60);