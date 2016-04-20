function [ output ] = methode3( k )
if k == 0
    output = 0.7;
    return;
else
    value = methode3(k-1);
    output = (4-value)/(4*value+3);
    return;
end

