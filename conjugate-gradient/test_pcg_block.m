function xxx = test_pcg_block(A1, A2, A3, b1, b2, b3, x01, x02, x03, tol, maxit)
  t = clock();
  [x1_5, iter1_5, res_vec1_5] = p_cg(A1, b1, tol, maxit, x01, [], block_diag(A1, 5));
  time_seconds = etime(clock(), t)
  disp("pcg - block - 5 - nos5 - residual");
  disp(res_vec1_5(iter1_5));
  disp("pcg - block - 5 - nos5 - iterations");
  disp(iter1_5);
  disp("");
  
  t = clock();
  [x1_25, iter1_25, res_vec1_25] = p_cg(A1, b1, tol, maxit, x01, [], block_diag(A1, 25));
  time_seconds = etime(clock(), t)
  disp("pcg - block - 25 - nos5 - residual");
  disp(res_vec1_25(iter1_25));
  disp("pcg - block - 25 - nos5 - iterations");
  disp(iter1_25);
  disp("");
  
  t = clock();
  [x1_100, iter1_100, res_vec1_100] = p_cg(A1, b1, tol, maxit, x01, [], block_diag(A1, 100));
  time_seconds = etime(clock(), t)
  disp("pcg - block - 100 - nos5 - residual");
  disp(res_vec1_100(iter1_100));
  disp("pcg - block - 100 - nos5 - iterations");
  disp(iter1_100);
  disp("");

  
  
  t = clock();
  [x2_5, iter2_5, res_vec2_5] = p_cg(A2, b2, tol, maxit, x02, [], block_diag(A2, 5));
  time_seconds = etime(clock(), t)
  disp("pcg - block - 5 - nos6 - residual");
  disp(res_vec2_5(iter2_5));
  disp("pcg - block - 5 - nos6 - iterations");
  disp(iter2_5);
  disp("");
  
  t = clock();
  [x2_25, iter2_25, res_vec2_25] = p_cg(A2, b2, tol, maxit, x02, [], block_diag(A2, 25));
  time_seconds = etime(clock(), t)
  disp("pcg - block - 25 - nos6 - residual");
  disp(res_vec2_25(iter2_25));
  disp("pcg - block - 25 - nos6 - iterations");
  disp(iter2_25);
  disp("");
  
  t = clock();
  [x2_100, iter2_100, res_vec2_100] = p_cg(A2, b2, tol, maxit, x02, [], block_diag(A2, 100));
  time_seconds = etime(clock(), t)
  disp("pcg - block - 100 - nos6 - residual");
  disp(res_vec2_100(iter2_100));
  disp("pcg - block - 100 - nos6 - iterations");
  disp(iter2_100);
  disp("");
  
  
  
  t = clock();
  [x3_5, iter3_5, res_vec3_5] = p_cg(A3, b3, tol, maxit, x03, [], block_diag(A3, 5));
  time_seconds = etime(clock(), t)
  disp("pcg - block - 5 - s3rmt3m3 - residual");
  disp(res_vec3_5(iter3_5));
  disp("pcg - block - 5 - s3rmt3m3 - iterations");
  disp(iter3_5);
  disp("");
  
  t = clock();
  [x3_25, iter3_25, res_vec3_25] = p_cg(A3, b3, tol, maxit, x03, [], block_diag(A3, 25));
  time_seconds = etime(clock(), t)
  disp("pcg - block - 25 - s3rmt3m3 - residual");
  disp(res_vec3_25(iter3_25));
  disp("pcg - block - 25 - s3rmt3m3 - iterations");
  disp(iter3_25);
  disp("");
  
  t = clock();
  [x3_100, iter3_100, res_vec3_100] = p_cg(A3, b3, tol, maxit, x03, [], block_diag(A3, 100));
  time_seconds = etime(clock(), t)
  disp("pcg - block - 100 - s3rmt3m3 - residual");
  disp(res_vec3_100(iter3_100));
  disp("pcg - block - 100 - s3rmt3m3 - iterations");
  disp(iter3_100);
  disp("");
  
  warning off;
  
  semilogy([1 : iter1_5], res_vec1_5);
  hold on;
  semilogy([1 : iter1_25], res_vec1_25);
  hold on;
  semilogy([1 : iter1_100], res_vec1_100);
  hold on;
  
  semilogy([1 : iter2_5], res_vec2_5);
  hold on;
  semilogy([1 : iter2_25], res_vec2_25);
  hold on;
  semilogy([1 : iter2_100], res_vec2_100);
  hold on;
  
  semilogy([1 : iter3_5], res_vec3_5);
  hold on;
  semilogy([1 : iter3_25], res_vec3_25);
  hold on;
  semilogy([1 : iter3_100], res_vec3_100);
  hold off;
  
  legend(
      'nos5 - 5 threshold',
      'nos5 - 25 threshold',
      'nos5 - 100 threshold',
      'nos6 - 5 threshold',
      'nos6 - 25 threshold',
      'nos6 - 100 threshold',
      's3rmt3m3 - 5 threshold',
      's3rmt3m3 - 25 threshold',
      's3rmt3m3 - 100 threshold', 
      'Location', 'northeast');
  title('Relative residual results for pcg with Block-diagonal (block Jacobi) preconditioner');
  xlabel('Iteration');
  ylabel('Residual');
endfunction