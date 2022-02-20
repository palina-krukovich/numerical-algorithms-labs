function x = solveL(B, b, n)
    nargin == 3 || error('Not enough input arguments. Arguments B, b and n are required.');
    validateattributes(n, {'numeric'}, {'positive'});
    validateattributes(B, {'numeric'}, {'size', [n, n]});
    validateattributes(b, {'numeric'}, {'size', [n, 1]});
    
    % Calculate L according to: B = L + U - I
    L = tril(B, -1) + eye(n);
    
    x = zeros(n, 1);
    for i = 1 : n
        x(i) = b(i);
        b(i + 1 : n) = b(i + 1 : n) - L(i + 1 : n, i) * x(i);
    endfor
endfunction