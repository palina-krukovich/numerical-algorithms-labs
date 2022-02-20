function [x, delta_x] = lhs_perturbation(A, E, b, delta_b)
  validateattributes(A, {'numeric'}, {'square'});
  validateattributes(E, {'numeric'}, {'square'});
  validateattributes(b, {'numeric'}, {'vector'});
  validateattributes(delta_b, {'numeric'}, {'vector'});

  x = A \ b;
  x_hat = (A + E) \ (b + delta_b);
  delta_x = x_hat - x;
endfunction
