function [ p ] = coffee_initial_params()
%COFFEE_INITIAL_PARAMS Contains definitions of initial parameters for
%coffee problem, returned in named struct params

%Cup properties
    p.cup_d = 8 / 100; % meters
    p.cup_h = 10 / 100; % meters
    p.cup_t = 0.7 / 100; % meters
    p.cup_cond = 1.5; % W / m / K

    
%Coffee properties
    p.coffee_spheat = 4186; % J / (g*K)
    p.coffee_dens = 1000; % kg / m^3
    p.coffee_initial_temp = 370; %K
    
%Creamer properties
    p.cream_volume = 0.1 / 1000; % m^3
    p.cream_addition_time = 10*60; %seconds
    p.cream_temp = 275; %K
    
    p.env_temp = 290; % K
    
    p.simulation_length = 30*60; %seconds
    
end

