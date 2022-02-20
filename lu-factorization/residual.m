function r =  residual(A, x_hat, b)
    nargin == 3 || error('Not enough input arguments. Arguments A, x_hat and b are required.');
    validateattributes(A, {'numeric'}, {'square'});
    validateattributes(x_hat, {'numeric'}, {'vector'});
    validateattributes(b, {'numeric'}, {'vector'});
    isequal(rows(x_hat), rows(b), columns(A)) || error('A is an n x n matrix, x_hat, b are vectors of size n');
    r = norm((A * x_hat) - b, 1) / (norm(A, 1) * norm(x_hat, 1));
endfunction