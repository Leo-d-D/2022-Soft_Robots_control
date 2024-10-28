%Determine the number of steps, ie how many iterations, to run the code for
numSteps = 25;

%Set up a list of time/iteration number values, starting at 0, ending at numSteps, t=0, 
% t = 1, t=2, . . .  
t = linspace(0,numSteps, numSteps+1);

%We'll store the x(t) values here:
x = zeros(1, numSteps+1);

%Pick initial condition:
x(1,1) = 1;

for i=1:numSteps
    x(1,i+1) = cos(x(1,i));
end

hold off
scatter(t, x, 'filled', 'b')
hold on

plot(t, x, 'b')

xlabel("t (number of iterations)")
ylabel("x(t)")

correct_value = .73909*ones([1,numSteps+1]);
plot(t, correct_value, 'r')

text(18,.76, 'x = 0.73909')
