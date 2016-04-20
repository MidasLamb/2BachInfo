function [napprox, approx] = halley(f, df, ddf, aa, K)
% f - function to compute roots of
% df - first-order derivative of f
% ddf - second-order derivative of f
% aa - starting point
% K - maximal number of iterations

a = aa;
approx = vpa(zeros(1, K));
napprox = 0;

for i = 1:K
    x = a;
    fa = vpa(subs(f));
    dfa = vpa(subs(df));
    ddfa = vpa(subs(ddf));
    den = vpa(2*(dfa^2) - fa*ddfa);
    if den == 0
        approx = approx(1:napprox);
        return
    end
    b = vpa(a - 2*fa*dfa/den);
    approx(i) = b;
    napprox = napprox+1;
    a = b;
end

approx = approx(1:napprox);
