function retval = part2()
    N = [1 : 10, 15 : 5 : 50, 60 : 10 : 150, 200 : 50 : 500, 600 : 100 : 1000];
    FEL = zeros(1, length(N));
    REL = zeros(1, length(N));
    FEU = zeros(1, length(N));
    REU = zeros(1, length(N));

    for i = 1 : length(N)
        n = N(i);
        do 
            A = rand(n);
        until(rank(A) == n);

        [B, P] = plu(A, n);
        U = triu(B);
        L = tril(B, -1) + eye(n);
        
        bl = sum(L, 2);
        Y = ones(n, 1);
        y = solveL(B, bl, n);
        FEL(1, i) = accuracy(Y, y);
        REL(1, i) = residual(L, y, bl);
        
        bu = sum(U, 2);
        X = ones(n, 1);
        x = solveU(B, bu, n);
        FEU(1, i) = accuracy(X, x);
        REU(1, i) = residual(U, x, bu);
    endfor

    warning off;
    semilogy(N, FEL);
    hold on;
    semilogy(N, REL);
    hold on;
    semilogy(N, FEU, '--');
    hold on;
    semilogy(N, REU, '--');
    hold off;

    legend(
        'Relative forward error for matrix L', 
        'Relative Residual Error for matrix L', 
        'Relative forward error for matrix U', 
        'Relative Residual Error for matrix U', 
        'Location', 'northwest');
    title('Forward / Backward Substitution');
    xlabel('Problem size');
    ylabel('Relative Residual / Forward Error of solving lower and upper triangular linear systems');
endfunction