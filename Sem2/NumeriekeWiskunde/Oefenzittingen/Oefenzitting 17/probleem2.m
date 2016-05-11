% A x = lambda x
% A^-1 x = (1 / lambda) x --> zelfde eigenvectoren, omgekeerde eigenwaarden

% (A - sigma I) x 
%  = A x - sigma x
%  = (lambda - sigma) x

% kracht van methode: alle eigenwaarden kunnen berekend worden
% sigma dicht bij eigenwaarde

B = [-1 4 0; -2 5 0; 0 1 2];
eigenwaarden = eig(B);
eigenwaarden = sort(eigenwaarden, 'descend');

n = 1:20;
x0 = [1; 0; 0];
sigma = 2.99;

[x, mu] = invmachten(B, x0, sigma, 20);
rel_fout_invmachten = abs(eigenwaarden(1) - mu) / abs(eigenwaarden(1));
[x, mu] = machten(B, x0, 20);
rel_fout_machten = abs(eigenwaarden(1) - mu) / abs(eigenwaarden(1));

semilogy(n, rel_fout_invmachten);
hold on;
semilogy(n, rel_fout_machten);
xlabel('aantal iteraties');
ylabel('relatieve fout');
legend('Inverse machten', 'Machten');

% theoretische convergentiefactor
theoretische_convergentiefactor = (1/(sigma - eigenwaarden(2))) / (1/(sigma - eigenwaarden(1)))
berekende_convergentiefactor = nthroot(rel_fout_invmachten(6) / rel_fout_invmachten(4), 2)