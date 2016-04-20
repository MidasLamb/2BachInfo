function [ output ] = methode4( k )
if k == 0
    output = 0.7;
    return;
else
    value = methode4(k-1);
    output = value - (value^2+value-1)/(2*value+1)
    return;
end

