function relerr = comprelerr(approx,zero,hp,n)

if nargin < 3
    hp = 100;
end
if nargin < 4
    n = length(approx);
end

relerr = double(vpa(abs((approx(1:n) - zero)/zero), hp));
