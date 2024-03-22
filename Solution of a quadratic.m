% Taking Inputs From User
handle = input('Enter the coefficients of the quadratic function [a, b, c]: ');
limit = input('Enter the domain limits [min, max]: ');
k = input('Enter 1 for minimum, 2 for roots, or 3 for both: ');

% Calculating Roots of the Quadratic Equation
a = handle(1);
b = handle(2);
c = handle(3);
delta = b^2 - 4*a*c;
if delta >= 0
    root1 = (-b + sqrt(delta)) / (2*a);
    root2 = (-b - sqrt(delta)) / (2*a);
else
    error('No real roots exist for the given coefficients.');
end

% Calculating Minimum Value Within Domain Limits
min_value = Inf;
for x = limit(1):0.1:limit(2)
    y = a*x^2 + b*x + c;
    if y < min_value
        min_value = y;
        x_min = x;
    end
    if (k == 1 || k == 3)
        plot(x, y, 'ro', 'MarkerSize', 5);
        hold on;
    end
end

% Displaying Results
if (k == 1 || k == 3)
    disp(['Minimum value within the domain limits: ', num2str(min_value)]);
end

if (k == 2 || k == 3)
    disp('Roots of the quadratic equation:');
    disp([root1, root2]);
    plot([root1, root2], [0, 0], 'bo', 'MarkerSize', 8, 'LineWidth', 2);
end
