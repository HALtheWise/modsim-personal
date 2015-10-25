clf;
hold on;

testpoints = linspace(0.001, 29.999*60, 7);

for testpoint = testpoints
	[Times, Temperatures] = coffee_init(testpoint);

    plot(Times / 60, Temperatures - 270,'.-');
end
    title('Coffee heat flow simulation (parameter sweep)');
    xlabel('Elapsed time (minutes)');
    ylabel('Coffee temperature (°C)');