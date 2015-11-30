function [ F12 ] = gravity_force_func( P1, m1, P2, m2 )
%FORCES Summary of this function goes here
%   Detailed explanation goes here

    G = 6.67408e-11;

    dist = norm(P1 - P2);
    
    magnitude = G*(m1*m2) / (dist.^2);
    
    F12 = (P1-P2)/dist * magnitude;
end

