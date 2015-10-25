optimaltime = fminsearch(@coffee_paramtest, 1*60);

fprintf('\nOptimal cream addition is at %f minutes\n', optimaltime / 60);