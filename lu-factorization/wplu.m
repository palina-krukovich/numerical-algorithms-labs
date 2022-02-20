function A =  wplu(A, n)
    nargin == 2 || error('Not enough input arguments. Arguments A and n are required.');
    validateattributes(n, {'numeric'}, {'positive'});
    validateattributes(A, {'numeric'}, {'square'});
    validateattributes(A, {'numeric'}, {'size', [n, n]});
    
    M = eye(n);
    for k = 1 : n - 1
        if (A(k, k) == 0)
            continue;
        endif
        for i = k + 1 : n
            M(i, k) = A(i, k) / A(k, k);
            A(i, k : n) = A(i, k : n) - M(i, k) * A(k, k : n);
        endfor
    endfor
    A = triu(A) + tril(M, -1);
endfunction