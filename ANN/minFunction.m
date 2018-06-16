function [jVal, gradient] = minFunction(theta)
  ## theta matrix 1 -> 4 * 4
  ## theta matrix 2 -> 3 * 4
  theta1 = reshape(theta(1:16), 4, 4);
  theta2 = reshape(theta(17:28), 3, 4);

  load("~/Dataset/iris/my/my_train.data");
  trainx = my_train(:, 1:4);
  trainy = my_train(:, 5);

  ## cost function val
  jVal = costFunction(theta, my_train);

  ## gradient
  D1 = zeros(4, 4);
  D2 = zeros(3, 4);
  for i = 1:length(trainx);
    x = trainx(1, :)';
    y = tranY(trainy(i));

    ## 1. 前向传播
    r  = HypothFunction(theta, x);
    a1 = x;
    z2 = theta1 * a1;
    a2 = ActiveFunction(z2);
    z3 = theta2 * a2;
    a3 = ActiveFunction(z3);
    ## 2.
    deta3 = (r - y) .* (ActiveFunction(z3) .* (1 - ActiveFunction(z3)));
    deta2 = (theta2' * deta3);
    deta2 = deta2 .* ((1 - ActiveFunction(z2)) .* ActiveFunction(z2));
    ## 3.
    D1 += deta2 * a1';
    D2 += deta3 * a2';
    ## break;
  end;
  D1 = D1 ./ length(trainx);
  D2 = D2 ./ length(trainx);
  ## display(D1);
  ## display(D2);
  gradient = [D1(:); D2(:)];

  ## display(gradient);
end
