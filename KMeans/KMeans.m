load("abs.data");

T = size(abs)(2);
K = 3;

m = size(abs)(1);
lastMu = zeros(K, T);
Mu = [abs(2,:); abs(3, :); abs(5,:)];
## display(Mu);
## display(lastMu);

do
  ## 1.
  C = 0 - ones(m, 1);
  Ci = zeros(m, 1);
  ## display(C);
  ## display(Ci);
  for i = 1:m;
    for j = 1:K;

      temp = abs(i,:) - Mu(j, :);
      ## display(abs(i,:));
      ## display(Mu(j,:));
      temp = temp * temp';
      ## display(temp);

      # display(temp);
      if C(i) == -1
        C(i) = temp;
        Ci(i) = j;
        continue
      elseif C(i) > temp
        C(i) = temp;
        Ci(i) = j;
      end;
      ## display(i);
      ## display(j);
      ## display(C(i));
    end;

  end;
  ## display(C);
  display(Ci);

  ## 2.
  lastMu = Mu;
  display(lastMu);
  display(Mu);
  for i = 1:K
    num = 0;
    temp = zeros(1, T);
    for j = 1:m;
      if (Ci(j) == i);
        num += 1;
        temp += abs(j, :);
      end
    end

    display(i);
    temp /= num;
    Mu(i, :) = temp;
    display(Mu);
    display(lastMu);
  end

until (Mu == lastMu)
display(Ci);

