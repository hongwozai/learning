function after = tranY(before)
    if before == 1;
      before = [1; 0; 0];
    elseif before == 2;
      before = [0; 1; 0];
    elseif before == 3;
      before = [0; 0; 1];
    end;
    after = before;
end
