function res = coffee_flows(~, stocks, params )
%COFFEE_FLOWS computes flows for coffee problem in Exercise Set 5
    coffee_energy = stocks(1);
    
    p = params;
    
    % Calculate variables
    area = pi*p.cup_d*p.cup_h+pi*(p.cup_d/2)^2;
    
    coffee_temp = energy_to_temperature(coffee_energy, p);
    
    %Calculate flows
    heat_loss = (p.cup_cond*area/p.cup_t)*(coffee_temp-p.env_temp);
    
    res = -heat_loss;
end

