function [lb, rb] = bounds(A, E, b, delta_b)
  validateattributes(A, {'numeric'}, {'square'});
  validateattributes(E, {'numeric'}, {'square'});
  validateattributes(b, {'numeric'}, {'vector'});
  validateattributes(delta_b, {'numeric'}, {'vector'});
  
  [x, delta_x] = lhs_perturbation(A, E, b, delta_b);
  lb = norm(delta_x) / norm(x);
  rb = cond(A) * (norm(delta_b) / norm(b) + norm(E) / norm(A));
endfunction