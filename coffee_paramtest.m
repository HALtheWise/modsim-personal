function [ temp_fall_time ] = coffee_paramtest( cream_addition_time )
%COFFEE_PARAMTEST Summary of this function goes here
%   Detailed explanation goes here
    safeTemp = 320;

	[Times, Temperatures] = coffee_runsim(cream_addition_time);
    CoolEnoughTimes = Times((Temperatures <= safeTemp));
    %disp(CoolEnoughTimes);
    if isempty(CoolEnoughTimes)
        temp_fall_time = inf;
        return
    end

    % TODO should linearly interpolate between nearest data points
    temp_fall_time = CoolEnoughTimes(1);
end

