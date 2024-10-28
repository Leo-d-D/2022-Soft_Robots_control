%This is the code used to create the figures for Example 1 in 
%lecture 6: fixed points

%Determine the number of steps to take:
numSteps = 10;

%Create a list of the times at which we'll find the position:
t = linspace(0,numSteps, numSteps+1);

%Create a variable to store the positions in:
x = zeros(2, numSteps+1);

%Determine the initial points:
x(1,1) = 0.03;
x(2,1) = -0.01;

%Calculate the position at t = 1, t = 2, . . . , t = numSteps
for i = 1:numSteps
    x(1,i+1) = -2*x(1,i) - 5*x(2,i);
    x(2, i+1) = x(1,i) + 3*x(2,i);
end

%Plot each position:
hold off
scatter(t, x(1,:), 'filled', 'b')
hold on
scatter(t, x(2,:), 'filled', 'r')

plot(t, x(1,:), 'b')
plot(t, x(2,:), 'r')
