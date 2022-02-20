function c = est_cond(A)
  validateattributes(A, {'numeric'}, {'square'});
  % Get size of square matrix A - n x n
  n = columns(A);
  % Factor A = LU
  [L, U] = lu(A);
  
  % Solve U' * w = e
  ek = 1.;
  t = zeros(n, 1);
  for k = 1 : n
    % Compute ek with respect to possible rescaling
    if (t(k, 1) != 0)
      ek = sign(-t(k, 1)) * abs(ek);  
    endif
    % Rescale ek (and t respectively) if needed so that |wk| <= 1 
    if (abs(U(k, k)) < abs(ek - t(k,1)))
      scale = abs(U(k, k)) / abs(ek - t(k, 1));
      t(1 : n, 1) = t(1 : n, 1) * scale;
      ek = ek * scale;
    endif
    % Compute tk+ = ek+ - tk
    tp = ek - t(k, 1);
    % Compute tk- = ek- - tk
    tn = -ek - t(k, 1);
    % Compute wk+ and wk-
    if ( U(k, k) != .0 )
      % Compute wk+ = (ek+ - tk) / Ukk
      wk = tp / U(k, k);
      % Compute wk- = (ek- - tk) / Ukk
      wkn = tn / U(k, k);
    else
      wk = 1.;
      wkn = 1.;
    endif
    % Compute wk
    if (k < n)
      % Calculate sum(tj+) and sum(tj-) with j = k..n
      sum_tp = abs(tp);
      sum_tn = abs(tn);
      for j = k + 1 : n
        sum_tn = sum_tn + abs(t(j, 1) + U(k, j) * wkn);
        sum_tp = sum_tp + abs(t(j, 1) + U(k, j) * wk);
      endfor
      % Define growth of ||w|| by comapring sum(tj+) and sum(tj-) with j = k..n
      if (sum_tp < sum_tn)
        % If sum(tj-) is larger than wk = wk-
        for j = k + 1 : n
          t(j, 1) = t(j, 1) + U(k, j) * wkn;
          wk = wkn;
        endfor
      else 
        % If sum(tj+) is larger than wk = wk+
        for j = k + 1 : n
          t(j, 1) = t(j, 1) + U(k, j) * wk;
        endfor
      endif
    endif
    t(k, 1) = wk;
  endfor
  
  % Solve L' * y = w (with w stored in t)
  y = L' \ t;
  % Solve L * v = y
  v = L \ y;
  % Solve U * z = v
  z = U \ v;
  % Compute RCOND
  RCOND = norm(y, 1) / (norm(A, 1) * norm(z, 1));
  % Compute condition number
  c = 1 / RCOND;
endfunction
