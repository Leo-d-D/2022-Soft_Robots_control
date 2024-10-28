%Determine the number of steps, ie how long (how many seconds) to run the
%code for:
numSteps = 10;

%Determine the number of initial points to consider:
numPoints = 20;

%Set up a list of time values, starting at 0, ending at numSteps, t=0, 
% t = 1, t=2, . . .  
t = linspace(0,numSteps, numSteps+1);

%We'll store the positions here:
x = zeros(numPoints, numSteps+1);

%Set up all the inital positions:
for i = 1:4
    x(i,1) = 11/16 + i*0.01;
end

for i = 1:4
    x(i+4,1) = 11/16 - i*0.01;
end

for i = 1:4
    x(i+8,1) = i*0.01 + 0.9;
end

for i = 1:4
    x(i+12,1) = 0+i*0.01;
end

x(17,1) = 0.8;
x(18,1) = 0.6;
x(19,1) = 11/16; %This is a fixed point
x(20,1) = 0; %This is a fixed point

%Use two sets of for loops to update each position, one by one, for as many
%seconds as we specified, using the given formula:
for j = 1:numPoints
    for i = 1:numSteps
        x(j,i+1) = 3.2*x(j,i)*(1-x(j,i));
    end
end

%Graph the results:
hold off

%Scatter plots the individual points.  We'll use a for loop to reduce the 
%amount of copy-and-pasting required here:
scatter(t, x(1,:), 'filled', 'b') %We'll use blue for the first 18 initial pts
hold on
for i = 2:numPoints-2
    scatter(t, x(i,:), 'filled', 'b')
end

%Plot creates the line connecting the points.  Again, using a for loop means we
%can avoid writing "plot" 18 times
for i = 1:numPoints-2
    plot(t, x(i,:), 'b')
end

%The last two initial points were the fixed points; I graph them in red
%to make it easier to keep track of those fixed points
plot(t, x(19,:), 'r')
plot(t, x(20,:), 'r')

scatter(t, x(19,:), 'filled', 'r')
scatter(t, x(20,:), 'filled', 'r')

%Get a list of values all = 0.7995, the first period 2 point found:
period_2_pt_1 = 0.7995*ones(numSteps+1);

%Plot the line at that period 2 point:
plot(t, period_2_pt_1, 'k')

%Repeat the process with the second period 2 point:
period_2_pt_2 = 0.5130*ones(numSteps+1);
plot(t, period_2_pt_2, 'k')