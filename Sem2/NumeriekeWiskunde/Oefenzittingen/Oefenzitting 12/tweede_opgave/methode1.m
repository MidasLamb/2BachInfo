function [ output ] = methode1( k )
if k == 0
    output = 0.7;
    return;
else
    output = 1 - methode1(k-1)^2;
    return;
end

