load("~/Dataset/diabetes/diabetes.tab.txt");
m = size(diabetes_tab, 1);
## train = diabetes_tab(1:m-20, :)
test = diabetes_tab(m-20:m, :);

initialTheta = zeros(11, 1);
options = optimset("MaxIter", 1000);

a = 1
b = 1
[optTheta, funVal, exitFlag] = fminunc(@costFunction, initialTheta, options);

## 对于测试集（数据集的最后21条）
h = optTheta' * [ones(21, 1) test(:, 1:10)]';
disp(h)