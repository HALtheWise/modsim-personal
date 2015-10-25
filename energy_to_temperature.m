function temp = energy_to_temperature( energy, params )
%ENERGY_TO_TEMPERATURE Given an energy stock, returns the corresponding
%temperature
    p=params;
    
    volume = pi*(p.cup_d/2)^2*p.cup_h;
    coffee_mass = volume*p.coffee_dens;
    heat_capacity = p.coffee_spheat*coffee_mass;
    
    temp = energy / heat_capacity;

end

