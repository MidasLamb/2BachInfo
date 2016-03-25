%% Probleem 1
% a_{j-1}*(t_j)³ + b_{j-1}*(t_j)² + c_{j-1}*(t_j) + d_{j-1} =
% a_j*(t_j)³ + b_j*(t_j)² + c_j*t_j + d_j

t = linspace(-1,1,10);
A = splinematrix(t);
spy(A)

s = size(A)
r = rank(A)

%% Probleem 2
%
t = linspace(-1,1,10);
f = @exp;
[A,b] = splinestelsel(t, f);
spy(A)

%% Probleem 3
%
t = -1:0.25:1;
f = @(x) 1./(1+25*x.^2);
[A,b] = splinestelsel(t, f);
c = A\b;

x = linspace(-1,1, 1000);
plot(x, f(x));
hold on
plot(x, evalspline(t, c, x));