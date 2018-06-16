function [jVal, gradient] = costFunction(theta)
  load("~/Dataset/diabetes/diabetes.tab.txt");
  m = size(diabetes_tab, 1) - 20;
  train = [ones(m, 1) diabetes_tab(1:m, :)];

  jVal = 0.5 * sum((theta' * train(:,1:11)' - train(:,12)') .^ 2) / m;

  gradient = zeros(11, 1);
  for i = 1:11;
    var = theta' * train(:, 1:11)';
    var -= train(:, 12)';
    var = var .* train(:, i)';
    var = sum(var);
    gradient(i) = 1/m * var;
  end;
end;
