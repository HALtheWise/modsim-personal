options = odeset('RelTol', 1e-6, 'Events', @event);

Y0 = [8.093e11 0 0 13000 0 0 0 0];

[Ts, Ys] = ode45(@flows_func,[0 6e8], Y0, options);

clf;
hold on;

plot(Ys(:,1), Ys(:,2))
plot(Ys(:,5), Ys(:,6))

legend('Jupiter', 'Sun');