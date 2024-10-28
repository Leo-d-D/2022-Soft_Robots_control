%Determine the number of steps, ie how long (how many seconds) to run the
%code for:
numSteps = 40;

%We'll store the positions here, for the uncontrolled system:
x_uncontrolled = zeros(2, numSteps+1);

%We'll store the positions here, for the controlled system:
x_controlled = zeros(2, numSteps+1);

%Set (the same) initial condition for the uncontrolled and controlled
%systems
x_uncontrolled(1,1) = 1;
x_uncontrolled(2,1) = 2;

x_controlled(1,1) = 1;
x_controlled(2,1) = 2;

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
scatter(x_controlled(1,:), x_controlled(2,:), 'filled', 'b')
hold on

scatter(x_uncontrolled(1,:), x_uncontrolled(2,:), 'filled', 'r')

legend("controlled", "uncontrolled", 'Autoupdate', 'off')

plot(x_controlled(1,:), x_controlled(2,:), 'b')

plot(x_uncontrolled(1,:), x_uncontrolled(2,:), 'r')

xlabel("x_{1}")
ylabel("x_{2}")