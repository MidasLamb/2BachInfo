% Oefening 1a
A = [7 8 0; 1 2 3; 4 5 6];

[L,U] = lu(A);

det(A)
prod(diag(L)) * prod(diag(U))

% Oefening 1b
A = [1 4 3; 4 3 5; 9 8 0];
[L,U] = lu(A)
% L is geen benedendriehoeksmatrix
% rijen verwisselen -> numeriek stabieler


% Oefening 2a
format long;
M = genmatrix1(6);
M_G1 = gauss1(M);
M_G2 = gauss2(M);
[M_Q, M_R] = qr(M);

x1 = asubst(M_G1);
x2 = asubst(M_G2);
x3 = asubst(M_R);

x = round(x3);

norm(x1 - x) / norm(x)
norm(x2 - x) / norm(x)
norm(x3 - x) / norm(x)


% Oefening 2b
M = genmatrix2(6);
M_G1 = gauss1(M);
M_G2 = gauss2(M);
[M_Q, M_R] = qr(M);

x1 = asubst(M_G1);
x2 = asubst(M_G2);
x3 = asubst(M_R);

x = round(x3);

norm(x1 - x) / norm(x)
norm(x2 - x) / norm(x)
norm(x3 - x) / norm(x)

% Oefening 3
M = genmatrixc(6);
M_G1 = gauss1(M);
M_G2 = gauss2(M);
[M_Q, M_R] = qr(M);

x1 = asubst(M_G1);
x2 = asubst(M_G2);
x3 = asubst(M_R);

x = round(x3);

norm(x1 - x) / norm(x)
norm(x2 - x) / norm(x)
norm(x3 - x) / norm(x)

% Oefening 3a
M = genmatrix1(6);
M_A = M(:,1:end-1);
M_b = M(:,end);
M_G1 = gauss1(M);
M_G2 = gauss2(M);
[M_Q, M_R] = qr(M);

x1 = asubst(M_G1);
x2 = asubst(M_G2);
x3 = asubst(M_R);

r1 = M_A * x1 - M_b;
r2 = M_A * x2 - M_b;
r3 = M_A * x3 - M_b;

norm(r1)/norm(M_b)
norm(r2)/norm(M_b)
norm(r3)/norm(M_b)


M = genmatrix2(6);
M_A = M(:,1:end-1);
M_b = M(:,end);
M_G1 = gauss1(M);
M_G2 = gauss2(M);
[M_Q, M_R] = qr(M);

x1 = asubst(M_G1);
x2 = asubst(M_G2);
x3 = asubst(M_R);

r1 = M_A * x1 - M_b;
r2 = M_A * x2 - M_b;
r3 = M_A * x3 - M_b;

norm(r1)/norm(M_b)
norm(r2)/norm(M_b)
norm(r3)/norm(M_b)


M = genmatrixc(6);
M_A = M(:,1:end-1);
M_b = M(:,end);
M_G1 = gauss1(M);
M_G2 = gauss2(M);
[M_Q, M_R] = qr(M);

x1 = asubst(M_G1);
x2 = asubst(M_G2);
x3 = asubst(M_R);

r1 = M_A * x1 - M_b;
r2 = M_A * x2 - M_b;
r3 = M_A * x3 - M_b;

norm(r1)/norm(M_b)
norm(r2)/norm(M_b)
norm(r3)/norm(M_b)

% de qr methode is het meest stabiel
% Methode die gebruik maakt van orthogonale matrices over het algemeen stabiel

% Gauss2 en qr goed geconditioneerd