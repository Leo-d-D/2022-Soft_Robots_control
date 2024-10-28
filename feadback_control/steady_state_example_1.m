%Determine the number of steps, ie how many iterations, to run the code for
numSteps = 80;
numPoints = 5;

y = zeros([1,numSteps+1]);

%We'll store the x(t) values here:
x = zeros(5, numSteps+1);

%Pick initial condition:
x(1,1) = 0.1;
x(2,1) = 0.9;
x(3,1) = 0.3;
x(4,1) = 0.8;
x(5,1) = 0.2;

r = 4;

for j=1:numPoints
    for i=1:numSteps
        x(j,i+1) = r*x(j,i)*(1-x(j,i));
    end
end

hold off
hold on
grid on
scatter(x(1,:),y, 'r', 'filled')
scatter(x(2,:),y, 'b', 'filled')
scatter(x(3,:),y, 'g', 'filled')
scatter(x(4,:),y, 'k', 'filled')
scatter(x(5,:),y, 'v', 'filled')

set(gca, 'ytick', [])
ylim([0,1])