function y = evalueer_lagrange(x, f, z)

y = 0;
for i = 1:numel(x)
    t= f(i);
    for j = 1:numel(x)
        if (j ~= i)
            t = t.*(z-x(j))/(x(i) - x(j));
        end
    end
    y = y + t;
end

