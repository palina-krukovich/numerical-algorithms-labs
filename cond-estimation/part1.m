function x = part1()
  N = [1 : 10 : 500];
  Y_octave = zeros(1, length(N));
  Y_custom = zeros(1, length(N));
  Y_runtime_octave_exact = zeros(1, length(N));
  Y_runtime_octave_est = zeros(1, length(N));
  Y_runtime_custom_est = zeros(1, length(N));
  for k = 1 : length(N)
    n = N(k);
    A = rand(n);
    
    t = clock();
    octave_cond = cond(A, 1);
    Y_runtime_octave_exact(1, k) = etime(clock(), t);

    t = clock();  
    octave_condest = condest(A);
    Y_runtime_octave_est(1, k) = etime(clock(), t);
    
    t = clock();
    custom_est_cond = est_cond(A);
    Y_runtime_custom_est(1, k) = etime(clock(), t);
    
    magn_octave = magnitude(octave_condest, octave_cond);
    magn_custom = magnitude(custom_est_cond, octave_cond);
    
    Y_octave(1, k) = magn_octave;
    Y_custom(1, k) = magn_custom;
  endfor

  warning off;
  subplot(2, 1, 1);
  semilogy(N, Y_octave, '-ob');
  hold on;
  semilogy(N, Y_custom, '-om');
  hold off;
  legend(
      'Magnitude between Octave estimated and Octave exact condition numbers', 
      'Magnitude between Custom estimated and Octave exact condition numbers',
      'Location', 'northwest');
  title('Magnitudes between estimated and exact condition numbers');
  xlabel('Problem size');
  ylabel('Magnitude');

  subplot(2, 1, 2);
  semilogy(N, Y_runtime_octave_exact, '-b');
  hold on;
  semilogy(N, Y_runtime_octave_est, '-r');
  hold on;
  semilogy(N, Y_runtime_custom_est, '-m');
  hold off;
  legend(
      'Runtime performance of Octave cond algorithm', 
      'Runtime performance of Octave condest algorithm',
      'Runtime performance of custom algorithm',
      'Location', 'northwest');
  title('Rutime comparison of cond, condest and custom algorithms');
  xlabel('Problem size');
  ylabel('Runtime performance');
endfunction