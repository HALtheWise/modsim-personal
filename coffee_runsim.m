function [Times, Temperatures] = coffee_runsim(cream_addition_time)
    % Define simulation parameters
    p = coffee_initial_params();
    p.cream_addition_time = cream_addition_time;

    % Calculate initial energy
    initial_coffee_heat = pi*(p.cup_d/2)^2*p.cup_h * ...
        p.coffee_dens * p.coffee_spheat * p.coffee_initial_temp;

    % Run simulation part 1
    [Times1, Stocks1] = ode45(@coffee_flows, [0 p.cream_addition_time], initial_coffee_heat, [], p);
    Temperatures1 = energy_to_temperature(Stocks1, p);

    % Model creamer addition
    energy = Stocks1(end) + p.cream_volume*p.coffee_dens*p.coffee_spheat*p.cream_temp;
    liquid_surface = pi*(p.cup_d/2)^2;
    p.cup_h = p.cup_h + p.cream_volume/liquid_surface;

    % Run simulation part 2
    [Times2, Stocks2] = ode45(@coffee_flows, [Times1(end) p.simulation_length], energy, [], p);
    Temperatures2 = energy_to_temperature(Stocks2, p);


    % Graph results
    Times = cat(1, Times1, Times2);
    Temperatures = cat(1, Temperatures1, Temperatures2);
end