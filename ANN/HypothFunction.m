function y = HypothFunction(theta, x)
  ## theta matrix 1 -> 4 * 4
  ## theta matrix 2 -> 3 * 4
  theta1 = reshape(theta(1:16), 4, 4);
  theta2 = reshape(theta(17:28), 3, 4);

  ## hidden
  a1 = x;
  z2 = theta1 * a1;
  a2 = ActiveFunction(z2);
  ## output
  z3 = theta2 * a2;
  a3 = ActiveFunction(z3);

  ## display(a1);
  ## display(z2);
  ## display(a2);
  ## display(z3);
  ## display(a3);
  y = a3;
end;