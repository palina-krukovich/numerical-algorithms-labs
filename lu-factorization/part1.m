function retval = part1()
    N = [2 : 10, 15 : 5 : 50, 60 : 10 : 150, 200 : 50 : 500, 600 : 100 : 1000];
    Y_plu = zeros(1, length(N));
    Y_wplu = zeros(1, length(N));
    Y_lu = zeros(1, length(N));
    for i = 1 : length(N)
        n = N(i);
        A = rand(n);
        
        [LU, P] = plu(A, n);
        L = tril(LU, -1) + eye(n);
        U = triu(LU);
        Y_plu(1, i) = accuracy(P' * L * U, A);
        
        LU = wplu(A, n);
        L = tril(LU, -1) + eye(n);
        U = triu(LU);
        Y_wplu(1, i) = accuracy(L * U, A);
        
        [L, U, P] = lu(A);
        Y_lu(1, i) = accuracy(P' * L * U, A);
    endfor

    warning off;
    semilogy(N, Y_plu, '-');
    hold on;
    semilogy(N, Y_wplu, '--');
    hold on;
    semilogy(N, Y_lu, '-.');
    hold off;
    legend(
        'With Partial Pivoting', 
        'Without Partial Pivoting', 
        'Octave "lu" version', 
        'Location', 'northwest');
    title('LU Factorization Accuracy');
    xlabel('Problem size');
    ylabel('Accuracy of LU factorization');
endfunction