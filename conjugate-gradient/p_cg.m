function [x, iter, res_vec] = p_cg(A, b, tol, maxit, x0, M1, M2)
  validateattributes(A, {'numeric'}, {'square'});
  validateattributes(M1, {'numeric'}, {'square'});
  validateattributes(M2, {'numeric'}, {'square'});
  validateattributes(b, {'numeric'}, {'vector'});
  validateattributes(x0, {'numeric'}, {'vector'});
  validateattributes(tol, {'numeric'}, {'scalar'});
  validateattributes(maxit, {'numeric'}, {'scalar'});
  
  if (isempty(M1))     # Diagonal (Jacobi)
    M = M2; 
  elseif (isempty(M2)) # Block-diagonal (block-Jacobi)
    M = M1; 
  else                 # Incomplete factorization 
    M = M1 * M2; 
  endif

  x = x0;
  r = b - A * x;
  Minv_r = M \ r;
  s = Minv_r;
  
  for iter = 1 : maxit
    res_vec(iter) = residual(A, x, b);
    if (res_vec(iter) <= tol)     # Break if the residual is small enough
      break;
    endif
    A_s = A * s;                  # Compute the multiplication once
    a = r' * Minv_r / (s' * A_s); # Compute the step size alpha
    x = x + a * s;                # Update the solution
    r_new = r - a * A_s;          # Compute new residual
    Minv_r_new = M \ r_new;
    beta = (r_new' * Minv_r_new) / (r' * Minv_r);
    s = Minv_r_new + beta * s;    # Compute new search direction
    Minv_r = Minv_r_new;
    r = r_new;
  endfor  
endfunction