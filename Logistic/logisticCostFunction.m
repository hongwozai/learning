function [jVal, gradient] = logisticCostFunction(theta)
  load("~/Dataset/iris/my/my_train.data");
  m = size(my_train, 1);
  x = [ones(m, 1) my_train(:,1:4)];
  y = my_train(:, 5);

  ## disp(y)
  ## TODO: 向量化
  for i = 1:size(y, 1);
    a = 1;
    if y(i, 1) != a;
      y(i, 1) = 0;
    elseif y(i, 1) == a;
      y(i, 1) = 1;
    end;
  end;

  hVal = 1 + (e .^ (-1 * theta' * x'));
  hVal = 1 ./ hVal;
  jVal = y' * log(hVal)' + (1 - y)' * log(1 - hVal)';
  jVal = sum(jVal);
  jVal = -jVal / m;

  gradient = zeros(5, 1);
  for i = 1:5;
    var = mean((hVal - y') * x(:,i));
    gradient(i) = var;
  end;
end;
