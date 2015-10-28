function res = coffee_runsim(cream_addition_time)
    % Define simulation parameters
    p = coffee_initial_params();
    p.cream_addition_time = cream_addition_time;
    
    drinkable_threshold = 320;

    function [VALUE, ISTERMINAL, DIRECTION] = drinkableEvent(~, Y)
        coffee_temp = energy_to_temperature(Y(1), p);
        VALUE = coffee_temp - drinkable_threshold;
        ISTERMINAL = 0;
        DIRECTION = -1;
    end
    
    % Setup events
    options = odeset('Events', @drinkableEvent);

    % Calculate initial energy
    initial_coffee_heat = pi*(p.cup_d/2)^2*p.cup_h * ...
        p.coffee_dens * p.coffee_spheat * p.coffee_initial_temp;

    % Run simulation part 1
    [Times1, Stocks1, Events] = ode45(@coffee_flows, [0 p.cream_addition_time], initial_coffee_heat, options, p);

    if Events
        res = Events(1);
        return;
    end
    % Model creamer addition
    energy = Stocks1(end) + p.cream_volume*p.coffee_dens*p.coffee_spheat*p.cream_temp;
    liquid_surface = pi*(p.cup_d/2)^2;
    p.cup_h = p.cup_h + p.cream_volume/liquid_surface;
    
    [diff, ~, ~] = drinkableEvent(Times1(end), energy);
    if (diff < 0)
        res = Times1(end);
        return
    end

    % Run simulation part 2
    [~, ~, Events] = ode45(@coffee_flows, [Times1(end) p.simulation_length], energy, options, p);
    
    if Events
        res = Events(1);
        return;
    end
end