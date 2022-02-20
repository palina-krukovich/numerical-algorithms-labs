function m = magnitude(x, y)
  isscalar(x) && isscalar(y) || error('x and y have to be scalars');
  m = max(x, y) / min(x, y);
endfunction