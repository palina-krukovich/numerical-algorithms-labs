function r = residual(A, x_hat, b)
  nargin == 3 || error('The function "residual" takes 3 arguments');
  validateattributes(x_hat, {'numeric'}, {'vector'});
  validateattributes(A, {'numeric'}, {'square'});
  validateattributes(b, {'numeric'}, {'vector'});
  
  r = normest(A * x_hat - b) / (normest(A) * normest(x_hat));
endfunction