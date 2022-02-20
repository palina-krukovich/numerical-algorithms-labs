maxit = 100000;
tol = 10e-7;

[A1, n1] = mmread("nos5.mtx");
x01 = rand(n1, 1);
b1 = rand(n1, 1);
disp("Loaded nos5 matrix");

[A2, n2] = mmread("nos6.mtx");
x02 = rand(n2, 1);
b2 = rand(n2, 1);
disp("Loaded nos6 matrix");

[A3, n3] = mmread("s3rmt3m3.mtx");
x03 = rand(n3, 1);
b3 = rand(n3, 1);
disp("Loaded s3rmt3m3 matrix");
disp("");

# Part 1 - cg

# test_cg(A1, A2, A3, b1, b2, b3, x01, x02, x03, tol, maxit);


# Part 2.1 - pcg with diagonal preconditioner

# test_pcg_diag(A1, A2, A3, b1, b2, b3, x01, x02, x03, tol, maxit);


# Part 2.2 - pcg with Block-diagonal (block Jacobi) preconditioner

# test_pcg_block(A1, A2, A3, b1, b2, b3, x01, x02, x03, tol, maxit);


# Part 2.3 - pcg with Incomplete Cholesky factorization

 test_pcg_cholesky(A1, A2, A3, b1, b2, b3, x01, x02, x03, tol, maxit);
