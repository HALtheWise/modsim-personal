function [ y1 ] = odestep2( fun, y0, tstep )
%ODESTEP1 Summary of this function goes here
%   Detailed explanation goes here
    deriv = fun(y0);
    
    y1 = y0 + tstep * deriv;
    
    deriv2 = fun(y1);
    
    y1 = y0 + tstep * (deriv+deriv2)/2;
    

end

