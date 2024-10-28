%This is the code used to create the final figure in 
%lecture 6: fixed points

%Set number of steps:
numSteps = 3;

%Set number of initial test points
numPoints = 16;

%Create a list of the times at which we'll find the position:
t = linspace(0,numSteps, numSteps+1);

%Create a variable to store the positions in:
x = zeros(numPoints, numSteps + 1);

%Determine the initial points:
for i = 1:4
    x(i,1) = 0.5 + i*0.01;
end

for i = 1:4
    x(i+4,1) = 0.5 - i*0.01;
end

for i = 1:4
    x(i+8,1) = i*0.01;
end

for i = 1:4
    x(i+12,1) = -i*0.01;
end

%For each initial point, find the position at each time:
for j = 1:numPoints
    for i = 1:numSteps
        x(j,i+1) = 2*x(j,i)*(1-x(j,i));
    end
end

%Plot the results
hold off
scatter(t, x(1,:), 'filled', 'b')
hold on
for i = 2:numPoints
    scatter(t, x(i,:), 'filled', 'b')
end

for i = 1:numPoints
    plot(t, x(i,:), 'b')
end