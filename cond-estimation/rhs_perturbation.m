function [E, delta_b] = rhs_perturbation(n)
  validateattributes(n, {'numeric'}, {'positive'});
  
  delta_b = rand(n, 1);
  delta_b = delta_b * 0.00000001 / norm(delta_b, 1);
  E = rand(n);
  E = E * 0.00000001 / norm(E, 1);
endfunction
