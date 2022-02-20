function [A, P] =  plu(A, n)
    nargin == 2 || error('Not enough input arguments. Arguments A and n are required.');
    validateattributes(n, {'numeric'}, {'positive'});
    validateattributes(A, {'numeric'}, {'square'});
    validateattributes(A, {'numeric'}, {'size', [n, n]});
    
    P = eye(n);
    M = eye(n);
    for k = 1 : n - 1
        % Find index p such that |apk| ? |aik| for k ? i ? n
        ap = max(abs(A(k : n, k)));
        for i = k : n
            if (abs(A(i, k)) == ap)
                p = i;
                break;
            endif
        endfor
        if (p != k)
            % Interchange rows k and p
            A([p, k], k : n) = A([k, p], k : n); 
            P([p, k], :) = P([k, p], :); 
            M([p, k], 1 : k - 1) = M([k, p], 1 : k - 1);
        endif
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