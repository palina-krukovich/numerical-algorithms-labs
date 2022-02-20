function part3_1()
    N = [1 : 10, 15 : 5 : 50, 60 : 10 : 150, 200 : 50 : 500, 600 : 100 : 1000];
    f_plu = zeros(1, length(N));
    f_wplu = zeros(1, length(N));
    f_lu = zeros(1, length(N));
    r_plu = zeros(1, length(N));
    r_wplu = zeros(1, length(N));
    r_lu = zeros(1, length(N));

    for k = 1 : length(N)
        n = N(k);
        X = ones(n, 1);
        
        S = rand(n) * 2 - 1;    
        b = sum(S, 2);
        x_plu = linSolve(S, b, n);
        x_wplu = wlinSolve(S, b, n);
        x_lu = S \ b;
        
        f_plu(1, k) = accuracy(X, x_plu); 
        f_wplu(1, k) = accuracy(X, x_wplu);
        f_lu(1, k) = accuracy(X, x_lu);
        r_plu(1, k) = residual(S, x_plu, b);
        r_wplu(1, k) = residual(S, x_wplu, b);
        r_lu(1, k) = residual(S, x_lu, b);
    endfor

    warning off;
    semilogy(N, f_plu, '-');
    hold on;
    semilogy(N, f_wplu, '--');
    hold on;
    semilogy(N, f_lu, '-.');
    hold on;
    semilogy(N, r_plu, '-');
    hold on;
    semilogy(N, r_wplu, '--');
    hold on;
    semilogy(N, r_lu, '-.');
    hold off;
    legend(
        'S - With partial pivoting - Relative Forward Error', 
        'S - Without partial pivoting - Relative Forward Error',
        'S - OCTAVE - Relative Forward Error', 
        'S - With partial pivoting - Relative Residual',
        'S - Without partial pivoting - Relative Residual', 
        'S - OCTAVE - Relative Residual', 
        'Location', 'northwest');
    title('LU linear solver');
    xlabel('Problem size');
    ylabel('Relative Residual / Forward error of LU factorization solver');
endfunction