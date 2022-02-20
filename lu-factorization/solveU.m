function x = solveU(B, b, n)
    nargin == 3 || error('Not enough input arguments. Arguments B, b and n are required.');
    validateattributes(n, {'numeric'}, {'positive'});
    validateattributes(B, {'numeric'}, {'size', [n, n]});
    validateattributes(b, {'numeric'}, {'size', [n, 1]});
    
    % Calculate U according to: B = L + U - I
    U = triu(B);
    
    x = zeros(n, 1);
    for i = n : -1 : 1
        if (U(i, i) == 0) 
            continue; 
        endif
        x(i) = b(i) / U(i, i);
        b(1 : i - 1) = b(1 : i - 1) - U(1 : i - 1, i) * x(i);
    endfor
endfunction