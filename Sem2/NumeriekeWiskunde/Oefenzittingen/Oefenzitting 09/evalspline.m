% eerst kijken in welk knooppuntinterval x ligt
% dan veelterm berekenen voor dit interval
% evalueren in punt x

function y = evalspline(t, c, x)
    for (i = 1:length(x))
        j = 1;
        % waarom -2?
        while (j <= length(t)-2)
           if (x(i) >= t(j) && x(i) < t(j+1))
               break;
           end
           j = j+1;
        end
        start = 4*(j-1) + 1;
        p = c(start:start+3);
        y(i) = polyval(p, x(i));
    end
end

