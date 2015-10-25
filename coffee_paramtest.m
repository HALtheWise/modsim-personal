function [ temp_fall_time ] = coffee_paramtest( cream_addition_time )
%COFFEE_PARAMTEST Summary of this function goes here
%   Detailed explanation goes here
    safeTemp = 320;

	[Times, Temperatures] = coffee_runsim(cream_addition_time);
    CoolEnoughTimes = Times((Temperatures <= safeTemp));
    CoolEnoughTemps = Temperatures((Temperatures <= safeTemp));
    
    if isempty(CoolEnoughTimes)
        % Edge case: Coffee never reaches sufficiently cool temperature
        temp_fall_time = inf;
        return
    end
    
    TooHotTimes = Times((Temperatures > safeTemp));
    TooHotTemps = Temperatures((Temperatures > safeTemp));
    
    if isempty(TooHotTimes)
        % Edge case: Coffee begins simulation cool enough
        temp_fall_time = CoolEnoughTimes(1);
        return
    end
    
    % Linear extrapolation between nearest two data points
    temp_fall_time = TooHotTimes(end) + ...
        (CoolEnoughTimes(1) - TooHotTimes(end)) * ...
        (TooHotTemps(end) - safeTemp) / (TooHotTemps(end) - CoolEnoughTemps(1));
    
end