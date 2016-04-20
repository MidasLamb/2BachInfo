function [ output ] = methode2( k )
if k == 0
    output = 0.7;
    return;
else
    value = methode2(k-1);
    output = (3*(value)^2-value+1)/(4*value);
    return;
end

