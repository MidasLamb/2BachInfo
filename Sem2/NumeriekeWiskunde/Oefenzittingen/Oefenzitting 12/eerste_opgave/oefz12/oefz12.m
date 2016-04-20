% Define a function f(x) on the domain [a, b].
close all
syms x a b
a = 1;
b = 2;
%f = 4*x^4 - 5*x - 3;
%f = (x^2 - 2);
f = (x - 1.1)^2;
%f = (x - 1.4)^3;
%f = cos(x);
%f = (x - 1.4)*cos(x/2);
%f = (x - 1.4)^2*cos(x/2);
%f = (x - 1.4)^3*cos(x/2);
disp('Defined the function f(x), press a key to continue...')
f
pause

% Compute the first- and second-order derivatives of f.
df = diff(f, x);
ddf = diff(df, x);
disp('Computed first- and second-order derivatives of f:')
df
ddf
pause

% Set the variable precision to 100 digits.
lp = 70;
hp = 100;
digits(hp);

% Compute the roots of f in high precision.
z = solve(f, x);
z = vpa(z);
disp('The roots of f are')
z
disp('Press a key to plot f on [a, b]')
pause

% Plot f on [a, b]).
ezplot(f, [a b])

% Set the variable precision to low precision.
digits(lp);

% Run all the solvers.
K = 100; % Number of iterations.
z = z(z > a & z < b); % Which root to search for.
z = z(1);
disp('Press any key to search for root z = ')
z
pause
close all

[n, secantapprox] = secant(f, a, b, 20);
secantrelerr = comprelerr(secantapprox, z, hp);
figure(1);plot(secantapprox); hold all;
figure(2);semilogy(secantrelerr); hold all;
order = 1.618;
secantfactor = ofactor(secantapprox,z,order,hp);
figure(3);semilogy(secantfactor); hold all;

[n, newtonapprox] = newton(f, df, a, 20);
newtonrelerr = comprelerr(newtonapprox, z, hp);
figure(1);plot(newtonapprox);   
figure(2);semilogy(newtonrelerr);
order = 2.0;
newtonfactor = ofactor(newtonapprox,z,order,hp);
figure(3);semilogy(newtonfactor); 

[n, mullerapprox] = muller(f, a, b, (a+b)/2, 20);
mullerapprox = abs(mullerapprox);
mullerrelerr = comprelerr(mullerapprox, z, hp);
figure(1);plot(mullerapprox);
figure(2);semilogy(mullerrelerr);
order = 1.839;
mullerfactor = ofactor(mullerapprox,z,order,hp);
figure(3);semilogy(mullerfactor);

[n, halleyapprox] = halley(f, df, ddf, a, 20);
halleyrelerr = comprelerr(halleyapprox, z, hp);
figure(1);plot(halleyapprox);
figure(2);semilogy(halleyrelerr);
order = 3;
halleyfactor = ofactor(halleyapprox,z,order,hp);
figure(3);semilogy(halleyfactor);

[n, bisecapprox] = bisection(f, a, b, K);
bisecrelerr = comprelerr(bisecapprox, z, hp);
figure(1);plot(bisecapprox);
figure(2);semilogy(bisecrelerr);
order = 1.0;
bisecfactor = ofactor(bisecapprox,z,order,hp);
figure(3);semilogy(bisecfactor);

figure(1);
xlim([0, 20]);
xlabel('iteration');
ylabel('root');

figure(2);
xlabel('iteration');
ylabel('relative error');
legend('Secant','Newton','Muller','Halley','Bisection','location','ne');

figure(3);
xlim([0, 20]);
xlabel('iteration');
ylabel('convergence factor');
