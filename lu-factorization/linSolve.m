function x = linSolve(A, b, n)
    nargin >= 3 || error('Not enough input arguments. Arguments A, b and n are required.');
    validateattributes(n, {'numeric'}, {'positive'});
    validateattributes(A, {'numeric'}, {'size', [n, n]});
    validateattributes(b, {'numeric'}, {'size', [n, 1]});
    
    [LU, P] = plu(A, n);
    y = solveL(LU, P * b, n);
    x = solveU(LU, y, n);
endfunction