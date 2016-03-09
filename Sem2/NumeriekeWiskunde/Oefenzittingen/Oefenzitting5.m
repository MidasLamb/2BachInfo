% Probleem 1 -------------------------------------------------------------------------------
n = -1:-0.1:-15
h = 10.^n

y1 = (5*exp(h) - 5)./h
y2 = (5*exp(h) - 5*exp(-h))./(2*h)

rel1 = abs(5-y1)/5                %Relatieve fout is (verwacht-uitgekomen)/verwacht
rel2 = abs(5-y2)/5

figure
loglog(h, rel1)
hold on                           %Nodig zodat beide plots getekend worden, ofanders wordt de eerste door de tweede overschreven.
loglog(h, rel2)


% Probleem 2 -------------------------------------------------------------------------------
