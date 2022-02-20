function M = block_diag(A, block)
  n = size(A)(1);
  for i = 1 : block : n
    es = i + block - 1;
    if (es > n) 
      es = n; 
    endif
    M(i : es, i : es) = A(i : es, i : es);
  endfor
endfunction