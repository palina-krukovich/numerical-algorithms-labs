function part2()
  N = [100 : 50 : 1500];
  k = 10;
  Y_lb = zeros(1, length(N));
  Y_rb = zeros(1, length(N));
  for i = 1 : length(N)
    n = N(i);
    [E, delta_b] = rhs_perturbation(n);
    
    for j = 1 : k
      A = rand(n);
      b = rand(n, 1);
      
      [lb, rb] = bounds(A, E, b, delta_b);
      Y_lb(1, i) += lb;
      Y_rb(1, i) += rb;
    endfor
    Y_lb(1, i) /= k;
    Y_rb(1, i) /= k;
  endfor
  
  warning off;
  semilogy(N, Y_lb, '-or');
  hold on;
  semilogy(N, Y_rb, '-om');
  hold off;
  legend(
      'Average of the left hand side of the bound', 
      'Average of the rigth hand side of the bound',
      'Location', 'northwest');
  title('Averages of left and rigth hand sides of the bound');
  xlabel('Problem size');
  ylabel('Average of the left / rigth hand side of the bound');
endfunction