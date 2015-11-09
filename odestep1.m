function [ y1 ] = odestep1( fun, y0, tstep )
%ODESTEP1 Summary of this function goes here
%   Detailed explanation goes here
    deriv = fun(y0);
    
    y1 = y0 + tstep * deriv;

end

