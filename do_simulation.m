options = odeset('RelTol', 1e-6);
[Ts, Ys] = ode45(@flows_func,[0 1e6], [1 0 0 .00005 0 0 0 0], options);

clf;
hold on;

plot(Ys(:,1), Ys(:,2))
plot(Ys(:,5), Ys(:,6))