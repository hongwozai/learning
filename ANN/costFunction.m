function jVal = costFunction(theta, train)
  trainx = train(:, 1:4);
  trainy = train(:, 5);

  jVal = [0; 0; 0];
  for i = 1:length(train);
    y = trainy(i);
    y = tranY(y);
    x = trainx(i, :)';

    jVal += y .* log(HypothFunction(theta, x));
    ## display(y);
    ## display(log(HypothFunction(theta, x)));
    ## display(jVal);
    jVal += (1 - y) .* log(1 - HypothFunction(theta, x));

    ## display(x);
    ## display(y);
    ## display(jVal);
  end
  jVal = jVal ./ length(train);
  ## display(jVal);
  jVal = -sum(jVal);
  ## display(jVal);
end
