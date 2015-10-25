clf;
hold on;

testpoints = linspace(0.001, 29.999*60, 100);
CoolTimes = zeros(1, length(testpoints));


for i = 1:length(testpoints)
	CoolTimes(i) = coffee_paramtest(testpoints(i));
end

plot(testpoints, CoolTimes);
title('Coffee heat flow simulation (parameter sweep)');
xlabel('Elapsed time (minutes)');
ylabel('Coffee temperature (�C)');