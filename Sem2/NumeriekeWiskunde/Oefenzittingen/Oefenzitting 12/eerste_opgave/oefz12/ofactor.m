function o = ofactor(approx,zero,order,hp,n,lp)

if nargin < 4
    hp = 100;
end
if nargin < 5
    n = length(approx);
end
if nargin < 6
    lp = 70;
end

err = vpa(abs(approx(1:n) - zero), hp);
err = err(err > 10^(-lp+5));

o = double(vpa(err(2:end) ./ err(1:end-1).^order, hp));
