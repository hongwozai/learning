theta = [
         -0.3729617,
         0.8797783,
         -0.8391588,
         0.0803820,
         0.8383526,
         -0.8190509,
         0.9135655,
         -0.5351345,
         -0.002188,
]

[y, l] = HypoFunction(theta, [1; 1]);

theta1 = reshape(theta(1:6), 2, 3)';
theta2 = reshape(theta(7:9), 3, 1)';
l1 = reshape(l(1:2), 2, 1);
l2 = reshape(l(3:5), 3, 1);
l3 = reshape(l(5:5), 1, 1);

deta3 = (0 - y) * ActivationFunction(l3) * (1 - ActivationFunction(l3));

display(deta3);

deta2 = (theta2' * deta3) .* ActivationFunction(l2) .* (1 - ActivationFunction(l2));

display(deta2);

D1 = deta2 * ActivationFunction(l1)';
display(D1);

D2 = deta3 * ActivationFunction(l2)';
display(D2);
