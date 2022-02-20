function xxx = test_pcg_cholesky(A1, A2, A3, b1, b2, b3, x01, x02, x03, tol, maxit)
  opt.type = "nofill";
  opt.shape = "lower";
  opt.diagcomp = 0.5;
  L1 = ichol(A1, opt);
  t = clock();
  [x1, iter1, res_vec1] = p_cg(A1, b1, tol, maxit, x01, L1, L1');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - nos5 - residual");
  disp(res_vec1(iter1));
  disp("pcg - cholesky - nos5 - iterations");
  disp(iter1);
  disp("");
  
  L2 = ichol(A2, opt);
  t = clock();
  [x2, iter2, res_vec2] = p_cg(A2, b2, tol, maxit, x02, L2, L2');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - nos6 - residual");
  disp(res_vec2(iter2));
  disp("pcg - cholesky - nos6 - iterations");
  disp(iter2);
  disp("");
  
  L3 = ichol(A3, opt);
  t = clock();
  [x3, iter3, res_vec3] = p_cg(A3, b3, tol, maxit, x03, L3, L3');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - s3rmt3m3 - residual");
  disp(res_vec3(iter3));
  disp("pcg - cholesky - s3rmt3m3 - iterations");
  disp(iter3);
  disp("");
  
  
  
  opt.type = "ict";
  opt.shape = "lower";
  opt.droptol = 0.3;
  opt.diagcomp = 0.7;
  L1 = ichol(A1, opt);
  t = clock();
  [x1_1, iter1_1, res_vec1_1] = p_cg(A1, b1, tol, maxit, x01, L1, L1');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - 0.3 - nos5 - residual");
  disp(res_vec1_1(iter1_1));
  disp("pcg - cholesky - 0.3 - nos5 - iterations");
  disp(iter1_1);
  disp("");
  
  L2 = ichol(A2, opt);
  t = clock();
  [x2_1, iter2_1, res_vec2_1] = p_cg(A2, b2, tol, maxit, x02, L2, L2');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - 0.3 - nos6 - residual");
  disp(res_vec2_1(iter2_1));
  disp("pcg - cholesky - 0.3 - nos6 - iterations");
  disp(iter2_1);
  disp("");
  
  L3 = ichol(A3, opt);
  t = clock();
  [x3_1, iter3_1, res_vec3_1] = p_cg(A3, b3, tol, maxit, x03, L3, L3');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - 0.3 - s3rmt3m3 - residual");
  disp(res_vec3_1(iter3_1));
  disp("pcg - cholesky - 0.3 - s3rmt3m3 - iterations");
  disp(iter3_1);
  disp("");
  
  
  
  opt.type = "ict";
  opt.shape = "lower";
  opt.droptol = 0.5;
  opt.diagcomp = 0.7;
  L1 = ichol(A1, opt);
  t = clock();
  [x1_2, iter1_2, res_vec1_2] = p_cg(A1, b1, tol, maxit, x01, L1, L1');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - 0.5 - nos5 - residual");
  disp(res_vec1_2(iter1_2));
  disp("pcg - cholesky - 0.5 - nos5 - iterations");
  disp(iter1_2);
  disp("");
  
  L2 = ichol(A2, opt);
  t = clock();
  [x2_2, iter2_2, res_vec2_2] = p_cg(A2, b2, tol, maxit, x02, L2, L2');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - 0.5 - nos6 - residual");
  disp(res_vec2_2(iter2_2));
  disp("pcg - cholesky - 0.5 - nos6 - iterations");
  disp(iter2_2);
  disp("");
  
  L3 = ichol(A3, opt);
  t = clock();
  [x3_2, iter3_2, res_vec3_2] = p_cg(A3, b3, tol, maxit, x03, L3, L3');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - 0.5 - s3rmt3m3 - residual");
  disp(res_vec3_2(iter3_2));
  disp("pcg - cholesky - 0.5 - s3rmt3m3 - iterations");
  disp(iter3_2);
  disp("");
  
  
  
  opt.type = "ict";
  opt.shape = "lower";
  opt.droptol = 0.7;
  opt.diagcomp = 0.7;
  L1 = ichol(A1, opt);
  t = clock();
  [x1_3, iter1_3, res_vec1_3] = p_cg(A1, b1, tol, maxit, x01, L1, L1');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - 0.7 - nos5 - residual");
  disp(res_vec1_3(iter1_3));
  disp("pcg - cholesky - 0.7 - nos5 - iterations");
  disp(iter1_3);
  disp("");
  
  L2 = ichol(A2, opt);
  t = clock();
  [x2_3, iter2_3, res_vec2_3] = p_cg(A2, b2, tol, maxit, x02, L2, L2');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - 0.7 - nos6 - residual");
  disp(res_vec2_3(iter2_3));
  disp("pcg - cholesky - 0.7 - nos6 - iterations");
  disp(iter2_3);
  disp("");
  
  L3 = ichol(A3, opt);
  t = clock();
  [x3_3, iter3_3, res_vec3_3] = p_cg(A3, b3, tol, maxit, x03, L3, L3');
  time_seconds = etime(clock(), t)
  disp("pcg - cholesky - 0.7 - s3rmt3m3 - residual");
  disp(res_vec3_3(iter3_3));
  disp("pcg - cholesky - 0.7 - s3rmt3m3 - iterations");
  disp(iter3_3);
  disp("");
  
  
  
  
  warning off;
  
  semilogy([1 : iter1], res_vec1);
  hold on;
  semilogy([1 : iter2], res_vec2);
  hold on;
  semilogy([1 : iter3], res_vec3);
  hold on;
  semilogy([1 : iter1_1], res_vec1_1);
  hold on;
  semilogy([1 : iter2_1], res_vec2_1);
  hold on;
  semilogy([1 : iter3_1], res_vec3_1);
  hold on;
  semilogy([1 : iter1_2], res_vec1_2);
  hold on;
  semilogy([1 : iter2_2], res_vec2_2);
  hold on;
  semilogy([1 : iter3_2], res_vec3_2);
  hold on;
  semilogy([1 : iter1_3], res_vec1_3);
  hold on;
  semilogy([1 : iter2_3], res_vec2_3);
  hold on;
  semilogy([1 : iter3_3], res_vec3_3);
  hold off;
  legend(
      'nos5',
      'nos6',
      's3rmt3m3', 
      'nos5 - threshold 0.3',
      'nos6 - threshold 0.3',
      's3rmt3m3 - threshold 0.3', 
      'nos5 - threshold 0.5',
      'nos6 - threshold 0.5',
      's3rmt3m3 - threshold 0.5', 
      'nos5 - threshold 0.7',
      'nos6 - threshold 0.7',
      's3rmt3m3 - threshold 0.7', 
      'Location', 'northeast');
  title('Relative residual results for pcg with Incomplete Cholesky factorization');
  xlabel('Iteration');
  ylabel('Residual');
endfunction