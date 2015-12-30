function [value,isterminal,direction] = event(~,y)
%EVENTS Summary of this function goes here
%   Detailed explanation goes here

    value = y(2);
    isterminal = 1;
    direction = 1;

end

