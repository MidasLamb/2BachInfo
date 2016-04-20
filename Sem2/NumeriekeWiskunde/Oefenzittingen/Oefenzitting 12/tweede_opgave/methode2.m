function [ output ] = methode2( k )
if k == 0
    output = 0.7;
    return;
else
    output = (3*(methode2(k-1))^2-methode2(k-1)+1)/(4*methode2(k-1));
    return;
end

