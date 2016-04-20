function [napprox, approx] = newton(f, df, aa, K)
% f - function to compute roots of
% df - first-order derivative of f
% aa - starting point
% K - maximal number of iterations

a = aa;
approx = vpa(zeros(1, K));
napprox = 0;

for i = 1:K
    x = a;
    fa = vpa(subs(f));
    dfa = vpa(subs(df));
    if dfa == 0
        approx = approx(1:napprox);
        return
    end
    b = vpa(a - fa/dfa);
    approx(i) = b;
    napprox = napprox+1;
    a = b;
end

approx = approx(1:napprox);
