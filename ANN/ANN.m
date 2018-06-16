load("~/Dataset/iris/my/my_test.data");
m = size(my_test);
testx = my_test(:, 1:4);
testy = my_test(:, 5);

initialTheta = rand(28, 1);
options = optimset("MaxIter", 1000);


## display(testx(1, :)');
## y = HypothFunction(initialTheta, testx(1, :)');
## display(y);
## costFunction(initialTheta, [testx testy])


[optTheta, funval, exitFlag] = fminunc(@minFunction, initialTheta, options);

display(optTheta);
save "optTheta.data"
## display(testx(1, :)');
res = zeros(length(testx), 1);
for i = 1:length(testx);
  y = HypothFunction(optTheta, testx(i, :)');
  y = y > 0.5;
  if y(1) == 1;
    r = 1;
  elseif y(2) == 1;
    r = 2;
  elseif y(3) == 1;
    r = 3;
  end

  res(i) = (testy(i) == r);
end;
