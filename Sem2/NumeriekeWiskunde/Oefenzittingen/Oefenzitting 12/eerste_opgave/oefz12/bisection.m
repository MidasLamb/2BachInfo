function [napprox, approx] = bisection(f, aa, bb, K)
% f - function to compute roots of
% [aa, bb] - interval to compute roots of
% K - maximal number of iterations

a = aa;
b = bb;

x = aa;
fa = vpa(subs(f));
x = bb;
fb = vpa(subs(f));

approx = vpa(zeros(1, K));
napprox = 0;

if fa * fb >= 0
    approx = approx(1:napprox);
    return;
end

for i = 1:K
    m = vpa((a+b)/2);
    approx(i) = m;
    napprox = napprox + 1;
    x = m;
    fm = vpa(subs(f));
    if fm*fa < 0
        b = m;
        fb = fm;
    else
        a = m;
        fa = fm;
    end
end

approx = approx(1:napprox);
