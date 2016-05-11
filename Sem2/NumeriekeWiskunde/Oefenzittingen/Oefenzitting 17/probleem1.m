n = 1:20;
%x0 = [1; 0; 0];
x0 = [1; 1; 1];

A = [102 -201 100; 1 0 0; 0 1 0];
B = [-1 4 0; -2 5 0; 0 1 2];

%eigenwaarden = eig(A);
eigenwaarden = eig(B);
eigenwaarden = sort(eigenwaarden, 'descend');

%[x, mu] = machten(A, x0, 20);
[x, mu] = machten(B, x0, 20);
rel_fout = abs(eigenwaarden(1) - mu) / abs(eigenwaarden(1));

% slechts tot 8, omdat vanaf 9 rel fout = 0
semilogy(n, rel_fout);

% convergentiefactor: E_k = cte * rho^k
% log(E_k) = log(cte) + k log(rho)
% E_k+1 / E_k = rho  --> afwijkingen uitmiddelen E_k+10 / E_k = rho^10
%berekende_convergentiefactor = nthroot(rel_fout(8) / rel_fout(6), 2)
berekende_convergentiefactor = nthroot(rel_fout(14) / rel_fout(11), 3)
exacte_convergentiefactor = eigenwaarden(2) / eigenwaarden(1)

