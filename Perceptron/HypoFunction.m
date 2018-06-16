function [y, l] = HypoFunction(theta, x)
  ## 2 -> 3 -> 1
  ## theta1: 3 * 2 theta2: 1 * 3 both 9
  ## theta1 = reshape(theta(1:6), 3, 2);
  ## theta2 = reshape(theta(7:9), 1, 3);
  theta1 = reshape(theta(1:6), 2, 3)';
  theta2 = reshape(theta(7:9), 3, 1)';

  ##
  l1 = x;
  display(l1);
  l2 = theta1 * x;
  display(l2);
  display(ActivationFunction(l2));
  l3 = theta2 * ActivationFunction(l2);
  display(l3);
  display(ActivationFunction(l3));

  ##
  y = ActivationFunction(l3);
  l = [l1; l2; l3];
end;
