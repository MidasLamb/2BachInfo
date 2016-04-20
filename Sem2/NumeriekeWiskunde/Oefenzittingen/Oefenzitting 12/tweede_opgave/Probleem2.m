% methode 1
% relatieve fout

K = 100;
waardes = vpa(zeros(1, K));

% waardes berekenen

for k = 1:1:K
    waardes(k) = methode1(k);
end

figure(1); plot(1:1:K, waardes)

% relatieve fout plotten

relatievefout = waardes - (sqrt(5)-1)/2;

figure(2); plot(relatievefout, waardes)



