% res = simulatehaddock(initialValue, params)
% 

function eulers_method(initial_haddock)
    simDuration = 20; %years
    timeStep = 2; % years This must stay 1 until dt get properly implemented
    
    time = 0;
    Times = [0];
    Stocks = [initial_haddock];
    
    % Define stocks
    
    
    while time < simDuration
        dt = timeStep; % timestep length
        
        res1 = odestep1(@flowfunc, Stocks(end), dt);
        res2 = odestep2(@flowfunc, Stocks(end), dt);
        
        error = abs(res2-res1);
        
        dt = min(timeStep, .1/error);
        
        time = time + dt;
        
        % Apply various flows to stocks
        Stocks(end+1) = odestep2(@flowfunc, Stocks(end), dt);
        Times(end+1) = time;
    end
    
    plot(Times, Stocks, 'r+-');
    
    %res = H;
end