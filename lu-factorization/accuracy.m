function z = accuracy(X, Y)
    nargin == 2 || error ("Not enough input arguments. Arguments X and Y are required.");
    size_equal(X, Y) && (isvector(X) && isvector(Y) || issquare(X) && issquare(Y)) || error('X and Y arguments are either both n × n matrices or both vectors of size n');
    z = norm(X - Y, 1) / norm(Y, 1) ;
endfunction