%Determine the number of steps, ie how long (how many seconds) to run the
%code for:
numSteps = 40;

%Set up a list of time values, starting at 0, ending at numSteps, t=0, 
% t = 1, t=2, . . .  
t = linspace(0,numSteps, numSteps+1);

%We'll store the positions here, for the uncontrolled system:
x_uncontrolled = zeros(2, numSteps+1);

%We'll store the positions here, for the controlled system:
x_controlled = zeros(2, numSteps+1);

%Set (the same) initial condition for the uncontrolled and controlled
%systems
x_uncontrolled(1,1) = -0.1;
x_uncontrolled(2,1) = -.1;

x_controlled(1,1) = -0.6;
x_controlled(2,1) = -1.6;

%Use the given equations to update the uncontrolled system:
for i=1:numSteps
    x_uncontrolled(1,i+1) = 1/2*x_uncontrolled(1,i) - sqrt(3)/2*x_uncontrolled(2,i);
    x_uncontrolled(2,i+1) = sqrt(3)/2*x_uncontrolled(1,i) + 1/2*x_uncontrolled(2,i);
end

%Use the given equations to update the controlled system:
for i=1:numSteps
    u = -x_controlled(1,i) - x_controlled(2,i);
    x_controlled(1,i+1) = 1/2*x_controlled(1,i) - sqrt(3)/2*x_controlled(2,i);
    x_controlled(2,i+1) = sqrt(3)/2*x_controlled(1,i) + 1/2*x_controlled(2,i) + u;
end

hold off
scatter(t, x_controlled(1,:), 'filled', 'g')
hold on
scatter(t, x_controlled(2,:), 'filled', 'm')

scatter(t, x_uncontrolled(1,:), 'filled', 'b')
scatter(t, x_uncontrolled(2,:), 'filled', 'r')

legend("x_{1} controlled", "x_{2} controlled", "x_{1} uncontrolled", "x_{2} uncontrolled", 'Autoupdate', 'off')

plot(t, x_controlled(1,:), 'g')
plot(t, x_controlled(2,:), 'm')

plot(t, x_uncontrolled(1,:), 'b')
plot(t, x_uncontrolled(2,:), 'r')

xlabel("time (seconds)")
ylabel("Process State")