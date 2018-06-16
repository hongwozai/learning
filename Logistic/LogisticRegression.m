load("~/Dataset/iris/my/my_test.data");
m = size(my_test);
x = [ones(m, 1) my_test(:, 1:4)];

initialTheta = zeros(5, 1);
options = optimset("MaxIter", 1000);
[optTheta, funval, exitFlag] = fminunc(@logisticCostFunction, initialTheta, options);

hVal = 1 + (e .^ (-1 * optTheta' * x'));
hVal = 1 ./ hVal;
disp(find(hVal > 0.5)')