function [napprox, approx] = secant(f, aa, bb, K)
% f - function to compute roots of
% [aa, bb] - interval to compute roots of
% K - maximal number of iterations

a = aa;
b = bb;

x = aa;
fa = vpa(subs(f));

approx = vpa(zeros(1, K));
napprox = 0;

for i = 1:K
    x = b;
    fb = vpa(subs(f));
    if fb - fa == 0
        approx = approx(1:napprox);
        return
    end
    c = vpa(b - fb * (b - a) / (fb - fa));
    approx(i) = c;
    napprox = napprox + 1;
    a = b;
    fa = fb;
    b = c;
end

approx = approx(1:napprox);
