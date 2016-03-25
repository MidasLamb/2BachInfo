% Met de functie getrocketposition.m wordt de positie van een raket in
% Cartesische coordinaten bekomen in functie van de tijd. 
%
% De bedoeling is om de raket met een camera vanuit de oorsprong te volgen.
%
% De positie van de raket wordt omgezet naar de hoek in poolcoordinaten en
% hieruit wordt de hoeksnelheid omega van de camera afegeleid als een
% eindige differentie. 

%%
% Omzetten van Cartesische coordinaten naar poolcoordinaten:
%   x(1) = r*cos(theta)
%   x(2) = r*sin(theta)
% oplossen: 
%   * r = norm(x)
%   * tan(theta) = x(2) / x(1)
%% PROBLEEM ZIT HIERONDER!!! 
% Bij atan gaat er informatie verloren door de deling, terwijl bij atan2
% die informatie niet verloren gaat.
bereken_hoek = @(x) atan2( x(2),x(1) );


% vector met tijdstippen
N = 100;
t = linspace(0,2,N);

% reserveer geheugen
omega = zeros(N-1,1);
x     = zeros(N,2);

% initializatie
x(1,:) = getrocketposition(t(1));
hoek_vorige = bereken_hoek(x(1,:));

for k = 2:N
    
    % bereken de hoek
    x(k,:) = getrocketposition(t(k));
    hoek    = bereken_hoek(x(k,:));
    
    % bereken de hoeksnelheid
    %% PROBLEEM
    % Hier beginnen zoeken van probleem! Reverse engineer that shit!!
    omega(k-1) = (hoek - hoek_vorige)/(t(k) - t(k-1));
    
    
    
    % update hoek_vorige
    hoek_vorige = hoek;      
end

% plot resultaten
figure(1),clf

subplot(211)    
hold on
plot(0, 0, 'r.', 'markersize', 20)
plot(1, 0, 'm.', 'markersize', 20)
plot(x(:, 1), x(:, 2), 'b-')
for k = 1:round(N/10):N
    plot([0 x(k,1)],[0 x(k,2)],'k--*')
end
plot(0, 0, 'r.', 'markersize', 20)
plot(1, 0, 'm.', 'markersize', 20)
grid on
xlabel('x-positie')
ylabel('y-positie')
title('Positie raket','fontsize',16)
legend('Camera','Positie t=0','location','northeast')

subplot(212)
plot(t(2:end), omega, 'b-')
axis([min(t) max(t) -5 5])
xlabel('tijd t')
title('hoeksnelheid camera in (0,0)','fontsize',16)
grid on


    