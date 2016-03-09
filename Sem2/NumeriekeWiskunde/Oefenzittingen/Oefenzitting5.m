% Probleem 1
n = -1:-0.1:-15
h = 10.^n

y1 = (5*exp(h) - 5)./h
y2 = (5*exp(h) - 5*exp(-h))./(2*h)

rel1 = (5.-y1)/5
rel2 = (5.-y2)/5

figure
plot(h, rel1)
plot(h, rel2)
