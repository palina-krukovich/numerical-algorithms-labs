function xxx = test_pcg_diag(A1, A2, A3, b1, b2, b3, x01, x02, x03, tol, maxit) 
  t = clock();
  [x1, iter1, res_vec1] = p_cg(A1, b1, tol, maxit, x01, [], diag(diag(A1)));
  time_seconds = etime(clock(), t)
  disp("pcg - diag - nos5 - residual");
  disp(res_vec1(iter1));
  disp("pcg - diag - nos5 - iterations");
  disp(iter1);
  disp("");
  
  t = clock();
  [x2, iter2, res_vec2] = p_cg(A2, b2, tol, maxit, x02, [], diag(diag(A2)));
  time_seconds = etime(clock(), t)
  disp("pcg - diag - nos6 - residual");
  disp(res_vec2(iter2));
  disp("pcg - diag - nos6 - iterations");
  disp(iter2);
  disp("");
  
  t = clock();
  [x3, iter3, res_vec3] = p_cg(A3, b3, tol, maxit, x03, [], diag(diag(A3)));
  time_seconds = etime(clock(), t)
  disp("pcg - diag - s3rmt3m3 - residual");
  disp(res_vec3(iter3));
  disp("pcg - diag - s3rmt3m3 - iterations");
  disp(iter3);
  disp("");
  
  warning off;
  
  semilogy([1 : iter1], res_vec1);
  hold on;
  semilogy([1 : iter2], res_vec2);
  hold on;
  semilogy([1 : iter3], res_vec3);
  hold off;
  legend(
      'nos5',
      'nos6',
      's3rmt3m3', 
      'Location', 'northeast');
  title('Relative residual results for pcg with diagonal preconditioner');
  xlabel('Iteration');
  ylabel('Residual');
endfunction