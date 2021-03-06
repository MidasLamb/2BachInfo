% Probleem 1 -------------------------------------------------------------------------------
n = -1:-0.1:-15;
h = 10.^n;

y1 = (5*exp(h) - 5)./h;
y2 = (5*exp(h) - 5*exp(-h))./(2*h);

rel1 = abs(5-y1)/5;                %Relatieve fout is (verwacht-uitgekomen)/verwacht
rel2 = abs(5-y2)/5;

figure;
loglog(h, rel1);                   
hold on;                           %Nodig zodat beide plots getekend worden, ofanders wordt de eerste door de tweede overschreven.
loglog(h, rel2);                   
%Twee soorten fouten: benaderingsfout & afrondingsfout
%   f'(x) != (f(x+h) - f(x) / h) alleen juist voor als h oneindig klein is, matlab kan niet zo klein, dus quotient heeft grote relatieve fout.
%   Als h kleiner wordt wordt benadering beter, daarna gaat afrondingsfout belangrijker worden.


% Probleem 2 -------------------------------------------------------------------------------
hold on;
k1 = 1;
hk1 = h .^k1;
loglog(h, hk1, '--');
hold on;
k2 = 2;
hk2 = h .^k2;
loglog(h, hk2, '--');


% Probleem 3 -------------------------------------------------------------------------------
hold on;
grens_afrondingsfout = h.^(-1)*eps;
loglog(h, grens_afrondingsfout, '-.');
hold on;
x(1:141) = eps; 
plot(h, x, '--');
