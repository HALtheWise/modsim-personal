function [ temp_fall_time ] = coffee_paramtest( cream_addition_time )
%COFFEE_PARAMTEST Summary of this function goes here
%   Detailed explanation goes here
    safeTemp = 320;

	[Times, Temperatures] = coffee_runsim(cream_addition_time);
    CoolEnoughTimes = Times((Temperatures <= safeTemp));
    CoolEnoughTemps = Temperatures((Temperatures <= safeTemp));
    %disp(CoolEnoughTimes);
    if isempty(CoolEnoughTimes)
        temp_fall_time = inf;
        return
    end

    % TODO should linearly interpolate between nearest data points
    
    TooHotTimes = Times((Temperatures > safeTemp));
    TooHotTemps = Temperatures((Temperatures > safeTemp));
    if isempty(TooHotTimes)
        temp_fall_time = CoolEnoughTimes(1);
        return
    end
    
    temp_fall_time = TooHotTimes(end) + ...
        (CoolEnoughTimes(1) - TooHotTimes(end)) * ...
        (TooHotTemps(end) - safeTemp) / (TooHotTemps(end) - CoolEnoughTemps(1));
    
end