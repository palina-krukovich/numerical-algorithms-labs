function test_cg(A1, A2, A3, b1, b2, b3, x01, x02, x03, tol, maxit) 
  t = clock();
  [x1, iter1, res_vec1] = cg(A1, b1, tol, maxit, x01);
  time_seconds = etime(clock(), t)
  disp("cg - nos5 - residual");
  disp(res_vec1(iter1));
  disp("cg - nos5 - iterations");
  disp(iter1);
  disp("");
  
  t = clock();
  [x2, iter2, res_vec2] = cg(A2, b2, tol, maxit, x02);
  time_seconds = etime(clock(), t)
  disp("cg - nos6 - residual");
  disp(res_vec2(iter2));
  disp("cg - nos6 - iterations");
  disp(iter2);
  disp("");
  
  t = clock();
  [x3, iter3, res_vec3] = cg(A3, b3, tol, maxit, x03);
  time_seconds = etime(clock(), t)
  disp("cg - s3rmt3m3 - residual");
  disp(res_vec3(iter3));
  disp("cg - s3rmt3m3 - iterations");
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
      'nos5.mtx custom cg residuals',
      'nos6.mtx custom cg residuals',
      's3rmt3m3.mtx custom cg residuals', 
      'Location', 'northeast');
  title('Relative residual results of a cg solver');
  xlabel('Iteration');
  ylabel('Residual');
endfunction