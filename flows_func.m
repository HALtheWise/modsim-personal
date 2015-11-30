function flows = flows_func( ~, stocks )
%FLOWS_FUNC Summary of this function goes here
%   Detailed explanation goes here

    MJ = 10;
    MS = 100;
    
    % Stocks = (P1, V1, P2, V2)
    P1 = stocks(1:2);
    V1 = stocks(3:4);
    P2 = stocks(5:6);
    V2 = stocks(7:8);
    
    F12 = gravity_force_func(P1, MJ, P2, MS);
    F21 = gravity_force_func(P2, MS, P1, MJ);

    A1 = F21 / MJ;
    A2 = F12 / MS;
    
    flows = zeros(8,1);
    
    flows(1:2) = V1;
    flows(3:4) = A1;
    flows(5:6) = V2;
    flows(7:8) = A2;
end

