function [x, iter, res_vec] = cg(A, b, tol, maxit, x0)
  nargin == 5 || error('The function "cg" takes 5 arguments');
  validateattributes(A, {'numeric'}, {'square'});
  validateattributes(b, {'numeric'}, {'vector'});
  validateattributes(x0, {'numeric'}, {'vector'});
  validateattributes(tol, {'numeric'}, {'scalar'});
  validateattributes(maxit, {'numeric'}, {'scalar'});  
  
  x = x0;
  r = b - A * x;
  s = r;
  rtr = r' * r;  
  
  for iter = 1 : maxit
    res_vec(iter) = residual(A, x, b);
    if (res_vec(iter) <= tol)     # break if resiadual is small enough
      break;                      
    endif
    
    As = A * s;                   # Compute the multiplication once
    a = rtr / (s' * As);          # Compute the step size alpha
    x = x + a * s;                # Update the solution
    r = r - a * As;               # Compute new residual
    rtr_new = r' * r;
    s = r + (rtr_new / rtr) * s; # Compute new search direction
    rtr = rtr_new;
  endfor
endfunction