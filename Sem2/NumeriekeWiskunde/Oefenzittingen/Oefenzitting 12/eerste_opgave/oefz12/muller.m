function [napprox, approx] = muller(f, xx0, xx1, xx2, K)
% f - function to compute roots of
% [xx0, xx1, xx2] - starting points
% K - maximal number of iterations

x0 = xx0;
x = x0;
c0 = vpa(subs(f));

x1 = xx1;
x = x1;
c1 = vpa(subs(f));

x2 = xx2;
x = x2;
d1 = vpa(subs(f));

approx = vpa(zeros(1, K));
napprox = 0;

for i = 1:K
    x = x2;
    c2 = vpa(subs(f));
    if x2 - x1 == 0
        approx = approx(1:napprox);
        return
    end
    d2 = vpa((c2-c1)/(x2-x1));
    if x2 - x0 == 0
        approx = approx(1:napprox);
        return
    end
    a = vpa((d2-d1)/(x2-x0));
    b = vpa(d2 + (x2-x1)*a);
    x0 = x1;
    x1 = x2;
    c1 = c2;
    d1 = d2;
    if (b+sign(b)*sqrt(b^2-4*a*c2)) == 0
        approx = approx(1:napprox);
        return
    end
    x2 = vpa(x2 - 2*c2/(b+sign(b)*sqrt(b^2-4*a*c2)));
    approx(i) = x2;
    napprox = napprox + 1;
end

approx = approx(1:napprox);
