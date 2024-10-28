%This is the code used to create the first graph in 
%lecture 6: Fixed Points

%Initialize variable to store the points:
x = zeros([2,6]);

%Initial position:
x(1,1) = -1;
x(2,1) = 0;

%Store the position at t = 1, t = 2, . . . 
for i = 2:6
    x(1,i) = -2*x(1,i-1) - 5*x(2,i-1);
    x(2,i) = x(1,i-1) + 3*x(2,i-1);
end

%Plot the path and each individual point:
plot(x(1,:),x(2,:))
hold on
scatter(x(1,:),x(2,:), 'filled', 'ko')

%Lable the axes:
xlabel('x_{1}')
ylabel('x_{2}')

title('Path of an Object starting at (-1,0)')


text(-0.8,-0.2, '(-1,0) at t = 0')
text(2.2,-1, '(2,-1) at t = 1')
text(0.8,-1.2, '(1,-1) at t = 2')
text(3.2,-2.2, '(3,-2) at t = 3')
text(4.2, -3.2, '(4, -3) at t = 4')
text(5.8, -4.8, '(7,-5) at t = 5')

hold off