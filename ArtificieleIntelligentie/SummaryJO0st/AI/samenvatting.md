---
title: samenvatting AI
---

# introductie tot AI

AI heeft 2 verschillende doelen, een op lange termijn en een op korte termijn. Op korte termijn is het doel om systemen te ontwikkelen die specifieke taken ,die een zekere intelligentie vereisen, minstens even goed kunnen als mensen. 
Op lange termijn is het de bedoeling om de specifieke taken te doen wegvallen. Men wil systemen ontwikkelen die een zeker niveau van intelligentie bereiken dat vergelijkbaar/hoger is dan dat van mensen. Bij het bereiken van deze doelen wordt het effect van de menselijke intelligentie nagebootst, maar dit wordt niet gedaan door het simuleren er van.

definitie AI
:	de ontwikkeling en studie van geavanceerde computertoepassingen die taken uitvoeren die momenteel nog beter worden uitgevoerd door mensen.

# state-space representatation

## wat is state-space representation

Een state-space representation is een manier voor het voorstellen van een probleem, Hierbij wordt er gebruik gemaakt van een unieke voorstelling van elke toestand waar het probleem zich kan in bevinden. De begintoestand wordt al meteen voorgesteld door een van deze unieke voorstellingen. 

Verder worden er bij het opstellen van een state-space representation ook regels opgeschreven voor alle acties die kunnen worden uitgevoerd. Deze regels beschrijven het resultaat van elke actie, samen met de precondities die voldaan moeten zijn om de regel te kunnen uitvoeren. Deze regels worden de productieregels genoemd en zullen later gebruikt worden om het probleem op te lossen.

Om een state-space representation af te werken wordt nu nog opgeschreven aan welke voorwaarden de eindtoestand moet voldoen.

## technische problemen en trade-offs

- hoe worden de regels gekozen, en hoe vermijden dat er met een combinatie van regels lussen worden gevormd bij het zoeken naar oplossingen?
- optimale oplossing of een oplossing?
- kan een toestand in componenten worden opgedeeld (en-boom/of-boom)
- voorwaarts of achterwaarts zoeken?

# blind search

In dit hoofdstuk worden basis zoekmethodes beschreven. Er wordt nog niet gezocht naar optimale oplossingen. Voor het zoeken wordt er gebruik gemaakt van zoekbomen.

## evaluatiecriteria

volledigheid
:	Vind het algoritme altijd een pad als er een pad bestaat?
snelheid
:	Hoeveel knopen moeten er maximaal gecreëerd worden?
geheugen
:	Wat is het maximale aantal knopen dat moet worden opgeslagen?

Al deze criteria worden uitgedrukt in functie van d, b en m respectievelijk de diepte, branching factor en diepte van de laagste oplossing.

In onze berekeningen wordt er echter maar een schatting van deze criteria gemaakt, er wordt immers geen rekening gehouden met de luscontrole, en de grootte van de paden die naar de verschillende knopen leiden.

## algoritmes

### diepte-eerst

bij diepte eerst wordt de boom zo ver mogelijk geëxpandeerd om terug te keren naar de hogere niveaus als dit nodig is.

![afbeelding van het diepte-eerst algoritme][algo_depth_first]

#### evaluatie

- volledigheid: indien er loopchecking wordt gedaan, en het net een eindig aantal knopen bevat zal het algoritme altijd een oplossing vinden
- snelheid: $$O(b^d)$$
- geheugen: $$O(d*b)$$

### breedte-eerst

expandeer de boom laag per laag, altijd maar dieper.

![afbeelding van het breedte-eerst algoritme][algo_breadth_first]

#### evaluatie

- volledigheid: vind altijd een oplossing, zelfs voor oneindige netten en zonder loopchecking. De gevonden oplossing zal zelfs altijd de optimale oplossing zijn.
- snelheid:$$O(b^m)$$
- geheugen: $$b^m$$

###  non-deterministic search

De 2 vorige algoritmes hebben allebei hun tekortkomingen, bij diepte-eerst kan het heel lang duren eer er een oplossing wordt gevonden als er diepe takken zonder oplossing zijn. Breedte-eerst gebruikt dan weer heel veel geheugen. Non-deterministec search probeert hier een middenweg in te vinden door paden in een willekeurige volgorde toe te voegen.

![afbeelding van het non-deterministic search algoritme][algo_non-deterministic]

#### evaluatie

dankzij het willekeurige gedrag van dit algoritme is het onmogelijk om een evaluatie op te stellen. 

### iterative deepening search

dit is een andere aanpak om de middenweg te zoeken tussen breedte-eerst en diepte-eerst. Hierbij wordt er een diepte-eerst zoekproces opgestart, maar wordt het beperkt tot een zekere diepte. Omwille van dit systeem wordt dit deel van het zoekalgoritme ook wel depth-limited search genoemd. Als er geen oplossing is gevonden wordt de diepte vergroot en wordt er een nieuw depth limited search proces opgestart.

![afbeelding van het depth limited search algoritme][algo_depth_limited]

![afbeelding van het iterative deepening search algoritme][algo_it_deepening]

#### evaluatie

- volledigheid: volledig, vind zelfs het korste pad
- snelheid:$$O(b^m-1)$$
- geheugen: $$b*m$$

deze methode combineert dus de voordelen van breedte- en diepte-eerst zoeken. Het wordt beschouwd als een heel goed compromis tussen de 2 methodes.

### bidirectional search

bij bidirectioneel zoeken wordt de zoekboom zowel van de start als van de doelknoop opgesteld, en gezocht naar een knoop die in beide bomen voorkomt. Dit kan echter alleen als het doel ook een specifieke toestand is. Dit gaat niet als het doel een aantal voorwaarden is waaraan de eindtoestand moet voldoen, dan zijn er immers meerdere eindknopen mogelijk om van te beginnen werken. Ook moeten er niet alleen regels zijn voor de acties voorwaarts toe te passen, maar ook regels om deze achterwaarts toe te passen.

![afbeelding van het bidirectioneel zoekalgoritme][algo_bidirectional]

#### evaluatie

- volledig
- snelheid: als de test op een gemeenschappelijke knoop in constante tijd kan gebeuren is deze van de orde $$O(b^{m/2})$$
- geheugen: $$O(b^{m/2})$$

# heuristisch zoeken

Om de vorige soorten algoritmes sterk te verbeteren moeten we informatie over het probleem toevoegen. Deze informatie moet echter toegevoegd worden op een zodanige manier dat de nieuwe algoritmes nog steeds algemeen toepasbaar zijn. Hiervoor wordt er gebruik gemaakt van heuristische functies. Deze functies drukken de kwaliteit uit van een toestand. Door een andere functie voor elk probleem te nemen is het mogelijk om informatie specifiek voor een probleem in een algemeen algoritme in te pluggen.

## algoritmes

### hill climbing

dit eenvoudige heuristisch zoekproces is in feite een diepte-eerst zoekproces waarop een heuristische functie wordt toegepast om te bepalen welke boom zal worden geëxpandeerd.

![algoritme voor hillclimbing][algo_hillclimbing]

#### evaluatie

doordat dit algoritme feitelijk op dezelfde manier werkt als depth-first heeft het dezelfde eigenschappen:

- volledig bij eindige zoekruimtes
- snelheid:$$O(b^d)$$
- geheugen:$$o(b*d)$$

### beam search

Bij beam search wordt er breedte-eerst gezocht, maar met een beperking op de maximale breedte. De bomen waarmee verder wordt gezocht zijn degene met de beste heuristische waardes.

![algoritme voor beam search][algo_beamsearch]

#### evaluatie

- volledigheid: niet volledig, dankzij de beperking in breedte wordt er geen volledige backtracking gedaan
- snelheid: $$width*m*b$$
- geheugen: constant met grootte width

### hill climbing 2

Hill climbing 2 is eigenlijk beam search met een breedte van 1. Door deze zeer sterke beperking van breedte is het algoritme exact aan hill climbing, maar de backtracking wordt niet gedaan. Door dat er niet aan backtracking wordt gedaan vormen er zich een aantal klassieke problemen. Deze zijn lokale maxima, plateaus en randen(ridges).

![klassieke problemen van hillclimbing 2][probs_hillclimbing2]

problemen met lokale maxima en plataues kunnen opgelost worden door random jumps te introduceren als gededecteerd wordt dat zo een punt bereikt is. Voor het omzeilen van ridges zal meer specifieke informatie over het probleem moeten worden gebruikt.

Hill climbing 2 is een voorbeeld van wat lokaal zoeken wordt genoemd. Hierbij wordt er 1 pad bijgehouden en wordt dat ene pad gebruikt om een nieuw pad te berekenen in de volgende stap.

#### evaluatie

de eigenschappen van hill climbing 2 zijn degene van beam search aangezien het een specifiek geval is van beam search.

### greedy search

greedy search is een algoritme dat steeds heuristisch gezien de beste knoop die nog niet is geëxpandeerd gaat expanderen, ongeacht waar in de boom deze zich bevind.

![algoritme voor greedy search][algo_greedy]

# optimale zoekmethodes

Optimale zoekmethodes zorgen ervoor dat de kost van het uitvoeren van het pad geminimaliseerd word, dit gaat echter wel ten koste van een meer gecompliceerd zoekproces. Om een optimaal zoekproces te kunnen uitvoeren moet de kost van elke actie/overgang gekend zijn.

Een makkelijke manier om dit voor te stellen is een route die van A naar B gaat over verschillende mogelijke wegen. De kost is dan de afstand die wordt gereden.

## algoritmes

### uniform cost algorithm

bij elke stap wordt de knoop geëxpandeerd die tot dan toe de laagste kost heeft geacumuleerd. In het voorbeeld van de route betekent dit dat elke keer het tussenpunt dat met de kortste weg is bereikt wordt gekozen om van verder te gaan.

![uniform cost search algoritme][algo_uniform]

Dit algoritme geeft echter niet altijd de meest optimale oplossing. Het kan zijn dat een tussenstap een kleine geaccumuleerde kost heeft, maar wordt gevolgd door een stap met een grote kost, terwijl er een andere route is die een hogere geacumuleerde kost heeft, maar met kleine stappen het doel bereikt.

![situatie waarin uniforme kost niet de optimale oplossing bereikt][probs_uniform]

### branch en bound principe

Het branch en bound principe is een toevoeging aan algoritmes om er zeker van te zijn dat steeds het optimale pad wordt gevonden. Dit principe zegt dat eens er een pad is gevonden naar de doelknoop alle paden met een hogere geaccumuleerde kost kunnen worden verwijderd, zij zullen immers een hogere kost hebben om het doel te bereiken dan het al bereikte doel.

Dit principe is heel gemakkelijk in te pluggen in het uniforme kost algoritme, en vormt dan het optimale uniforme kost algoritme. Het toepassen van dit principe op het uniforme kost algoritme bestaat er uit de eindvoorwaarde aan te passen. Het doel moet niet gewoon bereikt worden, maar het pad dat het doel bereikt moet als eerste in de queue staan.

![optimal uniform cost algoritme][algo_opt_uniform]

Dit algoritme bereikt een optimale oplossing als de kost op alle bogen groter dan 0 is. In het slechtse geval is het geheugengebruik echter net zo slecht als dat van breedte-eerst, het zelfde verhaal geldt voor wat snelheid betreft. Om dit algoritme te optimaliseren wordt er dan verder gebruik gemaakt van heuristieke functies. Deze functies moeten zodanig geschreven worden dat zij van elk punt in het net een schatting weergeven van hoe ver het nog is tot het doel, vervolgens verloopt de sortering op basis van de reeds geaccumuleerde kost + de kost die volgens de heuristiek nog nodig is om tot het doel te geraken. Eens deze heuristieke functies zijn ingeplugd krijgt het algoritme weer een andere naam: het estimate-extended uniform cost algoritme.

![estimate extended uniform cost algoritme][algo_est_op_uniform]

Als de heuristiek een onderschatting is van de realiteit zal dit algoritme steeds de optimale oplossing bekomen, vermits de heuristiek steeds een onderschatting is kan men steeds berekenen wat de minimale totale afstand tot het doel zal zijn (geaccumuleerde kost + heuristiek). Als deze schatting hoger is dan een al bereikt pad zal het steeds een langer pad opleveren dat het al gevonden pad. De schatting is immers een onderschatting.

Het gebruik van slechte heuristische waarden zal de winst ten opzichte van het niet gebruiken van heuristieken minimaal zijn. Bij het gebruik van goede heuristische waarden zullen er echter veel minder knopen geëxpandeerd moeten worden, wat dan weer tijdswinst oplevert in het zoekproces. Er moet echter wel rekening mee gehouden worden dat het berekenen van een complexe heuristische waarde ook tijd kost. Er moet dus naar een compromis gezocht worden tussen een minder goede, maar eenvoudige, en een complexe goede heuristiek voor het bereiken van het snelste resultaat.

### path deletion

dit is een verdere uitbreiding op het branch and bound principe waarbij er niet alleen rekening wordt gehouden met de eindknoop, maar ook met tussenliggende knopen. Als er meerdere verschillende paden naar dezelfde knoop zijn zal steeds alleen degene met de laagste geaccumuleerde kost overblijven, alle andere paden worden geschrapt.

### A* search

A* is de combinatie van de verschillende uitbreidingen op het optimale kost algoritme. Het combineert branch and bound, heuristieken en path deletion.

![A* search algoritme][algo_A*]

### iterative deepening A*

Deze versie van A* gaat een maximale f-waarde opleggen die bereikt mag worden. Vervolgens wordt er een A*-zoekproces opgestart, maar dit zoekproces stopt als de maximale f-waarde is bereikt. Dit zoekproces met een maximale f-waarde wordt f-limited search genoemd. Als het f-limited search algoritme geen resultaat oplevert wordt de f-waarde verhoogd en het hele proces opnieuw gestart. Dit herhalen van een f-limited search algoritme is het iterative deepening search algoritme.

![f limited search algoritme][algo_flimited]

![iterative deepening A*][algo_ida]

#### evaluatie

- volledigheid: onder dezelfde voorwaarden als A* wordt er een optimale oplossing bereikt
- snelheid: afhankelijk van hoeveel f contouren er nodig zijn om een oplossing te bereiken. In het slechtste geval van de orde $$O(n^2)$$
- geheugen als q de minimale kost is van een boog $$O(b*(cost(B)/q))$$

### simplified memory memory bounded A*

simplified memory bounded A* is niet echt een algoritme, het is meer een verzameling van technieken die moeten zorgen dat A* kan werken in een omgeving met een beperkte hoeveelheid geheugen. Hoe veel geheugen er gebruikt mag worden is al op voorhand geweten.

Het basisidee voor al deze technieken is dat telkens als er te weinig plaats is in het geheugen om een knoop te expanderen de knoop met de hoogste f waarde wordt verwijderd uit het geheugen. De f-waarde van het 'beste' vergeten kind wordt nog wel bijgehouden in de ouderknoop er van.

De eerste aanpassing die gedaan wordt aan A* is dat de kinderen van een knoop niet allemaal tegelijk, maar een per een aan de boom worden toegevoegd. Het kan immers zijn dat er niet genoeg ruimte in het geheugen is om ze allemaal toe te voegen.

Zo een situatie waar er niet geheugen beschikbaar is kan voorkomen als het expanderen van een knoop een langer pad geeft dan in het geheugen opgeslagen kan worden. In dat geval wordt het pad gewoon verwijderd en wordt de f-waarde van de te expanderen knoop op oneindig gezet. Deze zal immers nooit het doel bereiken vermits het pad dat er eventueel naar toe leidt niet in het geheugen past.

Als het gelukt is om van een knoop al zijn kinderen te verkennen, en de f-waardes van die kinderen zijn gekend dan kan de f-waarde van de ouderknoop aangepast worden naar het minimum van de f-waardes van de kinderen als deze kleiner is dan dat minimum. Dit is logisch aangezien de weg naar het doel door de ouderknoop zeker door een van de kinderknopen zal moeten.

#### evaluatie

- volledigheid: als het geheugen toestaat om het korste pad (minste knopen) op te slaan zal er een oplossing gevonden worden
- optimaliteit: als het geheugen groot genoeg is om het beste (kleinste kost) pad op te slaan zal dit het resultaat zijn, anders wordt het beste pad dat in het geheugen past terug gegeven.
- geheugen: gebruikt het geheugen dat ter beschikking wordt gesteld
- snelheid als het geheugen groot genoeg is dezelfde snelheid als A*

## opmerkingen

- Niet alle beter-dan-situaties kunnen in een heuristieke functie gevat worden
- het vinden van een optimaal pad is een heel complex probleem, in het slechtste geval groeit de complexiteit exponentieel met de groote van de zoekruimte. Er moet gekeken worden of het nodig is om de optimale situatie bekomen echt nodig is. Soms kan er ook gezocht worden naar een 'goede' oplossing.

# machine learning

Er zijn veel verschillende manieren om machine learning te benaderen. Deze manieren zijn in twee grote categoriën op te delen: de artificiele neurale netwerken die de werking van het brein proberen na te bootsen en de symbolische methodes die op een algoritmische manier een resultaat proberen te bekomen. In deze cursus wordt er een voorbeeld van de symbolische methodes uitgewerkt. Dit voorbeeld is version spaces

## version spaces

Het doel van version spaces is een concept te bepalen aan de hand van een aantal voorbeelden die al dan niet tot het concept behoren. Om dit concept te begrijpen en verwerkbaar te maken wordt er een hypothese ruimte ingevoerd. Deze hypothese ruimte is een vaste taal om concepten te beschrijven. Elk concept kan dan beschreven worden als een van de hypothesen in deze taal. Aan de taal worden nog twee speciale hypothesen toegevoegd: [????] voor de meest algemene hypothose, en $\bot$ voor de meest specifieke(lege) hypothese. In deze taal wordt ook een hiërarchie van verschillende concepten opgebouwd zodat er veralgemeend kan worden zonder ineens van het meest specifieke naar het meest algemene concept wordt gegaan. Als er meerdere factoren zijn waar het concept kan over handelen wordt er een conjunctie gemaakt van de individuele  eigenschappen. 

Eenmaal een concept is geleerd is het systeem in staat om te zeggen of een ander voorbeeld ,dat het systeem nog niet heeft gezien, aan het concept voldoet. Voorwaarde hiervoor is dat het systeem genoeg voorbeelden heeft gezien waarvan het geweten is of ze al dan niet tot het concept behoren. 

Het version space algoritme is opgebouwd uit 2 grote delen, en dan nog wat extra's die ervoor moeten zorgen dat deze delen beter samen werken. Het eerste deel van het version-space algoritme is het find-s algoritme. Dit algoritme gaat alleen de voorbeelden waarvan geweten is dat ze tot het concept behoren (de positieve voorbeelden) bekijken. Het algoritme vertrekt vanuit de meest specifieke set en gaat over alle positieve voorbeelden heen. Telkens als een voorbeeld niet door het huidige concept behoort wordt de set een minimale hoeveelheid veralgemeent zodat het voorbeeld er wel onder valt. 

![het find-s algoritme][algo_finds]

Find-s is een heel naïef algoritme als er fouten in de trainingsdata zit zal het helemaal mislopen, dit algoritme is niet in staat om fouten in deze data op te sporen. Het zal ook niet steeds het concept vinden. Wat wel heel gemakkelijk is aan find-s is dat het niet alle voorgaande voorbeelden moet onthouden. Vermits er steeds algemener wordt gegaan zullen alle voorbeelden nog steeds onder het nieuwe concept vallen.

Het tweede grote deel dat in version spaces wordt gebruikt is dual find s. Dit algoritme is net het tegenovergestelde va find-s. Het neemt alle negatieve voorbeelden en vertrekt van de meest algemene set. Telkens als een negatief voorbeeld wel voorkomt in de huidige set wordt deze specifieker gemaakt zodat het voorbeeld er niet meer in voorkomt.

![het dual-find-s algoritme][algo_dual_finds]

Het find-s algoritme combineert find-s en dual-find-s met als eerste toevoeging dat het niet een veralgemening/specifiering per keer toevoegt, maar telkens alle mogelijke minimale veralgemeningen/specifieringen. Bij het toevoegen van negatieve voorbeelden moet er echter wel op gelet worden dat deze nog steeds meer algemeen zijn dan de voorbeelden in de specifieke set. Dit geld natuurlijk ook omgekeerd, alle positieve voorbeelden die worden toegevoegd moeten nog steeds specifieker zijn dan de algemene set.

Als een negatief voorbeeld wordt toegevoegd kan er in de specifieke set (met de positieve voorbeelden) gekeken worden om dingen te schrappen. Positieve hypotheses mogen immers geen van de negatieve voorbeelden dekken. Ook dit geldt omgekeerd: als er een positief voorbeeld wordt toegevoegd kunnen in de algemene set alle voorbeelden worden geschrapt die niet aan het voorbeeld voldoen.

de laatste optimalisatie is het schrappen van redundante hypotheses, dit is wel iets dat alleen maar aan de algemene kant gedaan kan worden. Als er in de G-set(de algemene set) een conditie voorkomt die sterker is dan een andere conditie mag de zwakste hypothese geschrapt worden.

![deel 1 van het version spaces algoritme][algo_version_spaces]

![deel 2 van het version spaces algoritme][algo_version_spaces_2]

Dankzij het combineren van de twee algoritmes behandelt version spaces positieve en negatieve voorbeelden op exact dezelfde manier, en heeft het geen behoefte om voorgaande voorbeelden te onthouden. Het algoritme kan echter niet omgaan met ruis, als het ruis tegenkomt zal het hypotheses die niet weg moeten weg gooien.

# constraint processing

Een constraint probleem is een probleem waarbij een eindig aantal variabelen,met elk een eindig domein, een waarde uit hun domein krijgen toegewezen. Deze waardes moeten worden toegewezen zodanig dat ze voldoen aan beperkingen tussen de verschillende variabelen en op de variabelen zelf. 

Deze problemen worden vaak voorgesteld aan de hand van een constraint netwerk. Deze tekening tekent alle variabelen, en alle beperkingen hierop uit. 

![een constraint netwerk][constraint netwerk]

Een andere voorstelling, die vooral wordt gebruikt bij het zoeken, zijn of-bomen. Bij deze bomen wordt elke variabele op een ander niveau gezet. Voor elke variabele wordt dan elk element van zijn domein in de boom voorgesteld.

## oplossingtechnieken

### backtracking

#### chronogical backtracking

Bij chronological bactracking wordt de zoekboom van links naar rechts diepte-eerst doorzocht. Bij elke toevoeging wordt er gecontroleerd of de verschillende beperkingen op de nieuw toegevoegde waarde gecontroleerd.

#### backjumping
Bij backjumping probeert men te vermijden om een aantal redundante berekeningen te doen. Dit wordt gedaan door bij het falen steeds te kijken op welk niveau het nuttig is om aanpassingen te doen.

![diagram voor het terugspringen in backjumping][diagram_backjumping]

Het zoeken naar welk niveau er moet worden teruggesprongen wordt gedaan aan de hand van de gefaalde testen. Als blijkt dat de 3de variabele en de eerste variabele niet samen kunnen werken is het nutteloos om de tussenliggende variabele nog aan te passen. Voor dezelfde waarde van de eerste en de derde variabele zullen zij immers steeds falen (zie diagram).
![het backjumping algoritme][algoritme_backjumping]

#### backmarking
Backmarking heeft als doel om nog meer redundante testen te vermijden. In tegenstelling tot backjumping treed het niet alleen in werking wanneer een volledig blok testen faalt, maar treedt het ook in werking wanneer er in het blok nog testen zijn die slagen. In het diagram hieronder kan gezien worden dat een heel aantal testen redundant gebeurd. Deze testen zal backmarking er uit halen.

![redundantie die vermeden wordt bij backmarking][redundantie_backmarking]

Er zijn 2 aanpakken om deze redundantie te vermijden, namelijk tabulatie en backmarking. Bij tabulatie zal het resultaat van elke test worden bijgehouden in een tabel en zal eerst de tabel worden geraadpleegd voor het zoeken van het resultaat. Op deze manier moet het resultaat niet steeds opnieuw berekend worden, maar kan het uit de tabel gehaald worden. Deze aanpak vraagt echter behoorlijk wat meer geheugen, en zal de snelheidswinst beperkt worden door het feit dat er steeds in de tabel gezocht moet worden. 

Backmarking heeft in vergelijking een zeer beperkte geheugenvoetafdruk, en resulteert in een grotere snelheidswinst. Backmarking houdt 2 tabellen bij om de snelheidswinst te boeken. De eerste tabel houdt voor elke variabele Zk, per waarde bij bij de hoeveelste test de laatste was die is uitgevoerd. Als alle tests slagen zal deze waarde k-1 worden. Door dit bij te houden zal steeds alleen de laatste test opnieuw moeten worden uitgevoerd. Men weet immers dat de eerdere test geslaagd zijn, anders zou het algoritme de laatste niet hebben uitgevoerd.

De andere tabel wordt backup genoemd en bevat per variabele een waarde. In het begin van het algoritme staan alle waardes op 1, en ze worden verhoogd bij backtracking. In deze tabel wordt bijgehouden de hoeveel eerste constraints niet veranderen bij backtracking.

![het backmarking algoritme][algo_backmarking]

#### intelligent backtracking

Intelligent backmarking is niet zozeer een algoritme. Het is een algemeen framework dat kan worden gebruikt om backtracking te verbeteren. Bij dit framework worden er een aantal no-goods opgesteld. Een no-good is een verzameling van toewijzingen die nooit te samen kan voorkomen in een oplossing. Deze no-goods worden gebruikt om het achterwaartse gedraag te verbeteren.

#### dynamic search rearrangement

dynamic search rearrangement is een techniek die op elk backtrackings-algoritme kan worden toegepast. Deze techniek past dynamisch aan welke variabelen in de boom eerst worden geëxpandeerd. Hierbij wordt er gekozen voor een fail-first aanpak. Deze fail-first aanpak zorgt er voor dat de te doorzoeken ruimte al een pak kleiner wordt. 

Enkele heuristieken om dit principe toe te passen zijn:

- selecteer eerst de variabele met het kleinste domein
- selecteer eerst de zwaarst beperkte variabele
- pas heuristieken die specifiek voor het probleem zijn toe.


### relaxatie

Relaxatie is het vereenvoudigen van het probleem. Dit wordt meestal gedaan door het domein van het probleem te bekijken en hieruit een aantal dingen te schrappen, omdat zij niet mogelijk zijn in een oplossing. Hiervoor zijn er weer een aantal mogelijke technieken.

#### node consistency

node consistency is het toepassen van unaire constraints op het domein van het element waarop de constraint van toepassing is. De elementen van het domein die door de unaire constraints niet meer mogelijk zijn worden gewoon uit het domein gewist.

#### forward check

Bij forward check wordt er van uit gegaan dat minstens 1 variabele (a) al een waarde heeft toegekend gekregen. Vervolgens worden alle beperkingen op a geactiveerd om inconsistente gegevens uit het domein van andere variabelen te halen.

#### look ahead check

Deze methode is vergelijkbaar met forward check, maar gaat iets verder. In plaats van elke beperking op de variabele a eenmaal te activeren om elementen uit het domein van andere variabelen te halen zal bij forward check elke beperking, niet alleen deze op a, eenmaal geactiveerd worden om domeinelementen te schrappen.

#### AC 1

AC is een van de technieken die er voor zorgt dat de domeinen zodanig worden beperkt zodanig dat zij aan alle beperkingen voldoen. Wat deze methode doet is look-ahead check uitvoeren, en als er minstens 1 element is verwijderd uit een domein dit opnieuw uitvoeren. Dit blijft herhaald worden tot look-ahead check niet meer in staat is om elementen uit een domein te verwijderen.

![het AC1 algoritme][algo_AC1]

#### AC3

Het AC3 algoritme bereikt het zelfde resultaat als het AC1 algoritme, maar doet dit op een efficientere manier. Het werkt op basis van een rij met alle beperkingen in. de eerste beperking wordt uit de rij gehaald en alle elementen uit de domeinen die niet meer kunnen dankzij deze beperking worden verwijderd. de beperkingen die betrekking hebben op een van de domeinen waaruit elementen zijn verwijderd worden vervolgens opnieuw aan de rij toegevoegd, als ze er niet meer in zaten.

![het AC3 algoritme][algo_AC3]


### hybride technieken

Bij hybride techniekeken het backtrack-zoeken gecombineerd met de relaxatie, door verschillende relaxatiemethodes met het backtracken te combineren worden er andere effecten bereikt. Hierbij moet er steeds de afweging gemaakt worden of de tijd die de relaxatie in beslag neemt opweegt tegen de tijd die gewonnen wordt omdate er minder alternatieven moeten worden verwerkt.
### toepassingen

- scheduling
- rostering
- production planning

# planning

planning is het overbrengen van de omgeving van de ene naar de andere staat door een aantal acties in een bepaalde volgorde toe te passen. Al deze acties hebben precondities en een effect. 

## partial order regression planning, the strips approach

Bij strips wordt logica gebruikt om de staat van de omgeving voor te stellen. In deze voorstelling wordt er enkel gebruikt gemaakt van gegronde feiten. Elke staat van de wereld wordt individueel bekeken, er wordt dus geen verband tussen verschillende staten voorgesteld, en er is ook geen uitdrukking van tijd. 

Acties worden voorgesteld met behulp van 3 lijsten: de precondities, de delete lijst en de add lijst. De lijst met precondities bevat alle precondities die waar moeten zijn alvorens de actie kan worden uitgevoerd. De delete lijst en de add lijst beschrijven samen het effect van de actie. In de delete lijst staan de feiten die niet langer waar zijn na het uitvoeren van deze operatie, en deze dus geschrapt moeten worden uit de beschrijving van de staat van de omgeving. In de add lijst staan de feiten die niet altijd waar zijn voor de actie wordt uitgevoerd, maar wel altijd waar zijn nadat de actie is uitgevoerd. 

Het doel en de initiele toestand worden beschreven op een gelijkaardige manier: de initiele toestand is een actie met alleen maar een add lijst en het doel is een actie met alleen maar precondities.

Voor het zoeken met welke acties het doel bereikt kan worden zal er gebruik gemaakt worden van achterwaarts redeneren. De verschillende precondities van het doel worden een voor een waar gemaakt om zo het totale (complexere) doel te bereiken. Hiervoor wordt voor elke preconditie bekeken of deze al waar is. Als dit niet zo is wordt er een actie toegevoegd die het de preconditie waar maakt (de preconditie staat in zijn add lijst). Er wordt dan een zogenaamde establish link tussen de acties gelegd. Vervolgens wordt hetzelfde gedaan met de actie die net is toegevoegd, en dit totdat de initiele toestand gevolgd door de acties alle precondities waar maakt.

Deze establish links leggen een partial order op. Dit wil zeggen dat er getoond word dat een actie voor een andere moet gebeuren, maar dat dit niet de actie er exact voor moet zijn. Er mogen nog andere acties tussen komen als zij de establish link tussen de acties niet verbreken.

# automatisch redeneren

In logica kan vrijwel alles formeel worden uitgedrukt. En eens iets in logica is uitgedrukt kunnen er stellingen bewezen worden. Dit bewijs van stellingen kan geautomatiseerd worden. 

Bij dit proces zijn er echter wel een aantal moeilijkheden. De eerste moeilijkheid is dat het omzetten van een zin in natuurlijke taal naar een zin in logica geen makkelijke opgave is dankzij de dubbelzinnigheid van natuurlijke taal. Ten tweede vergeten we vaak evidente feiten (een man is een mens) als er informatie wordt omgezet in logica gewoon omdat dit voor ons zo een basiskennis is dat we er niet aan denken dat dit geen gekende informatie is voor een computer. Ook is logica zo gedetailleerd dat het niet altijd makkelijk is om mee te werken.

de stelling van church zegt dat er geen enkel algoritme betstaat dat beslist of F al dan niet een logisch gevolg is van een theorie T, voor elke formule F en elke formule T. Dit wordt schijnbaar tegengesproken door de volledigheidsstelling van Goedel. Deze zegt dat voor elke theorie T en formule F, waarbij F een logisch gevolg is van T, er een redeneertechniek bestaat die bewijst dat F een logsich gevolg is van T. Deze tegenspraak is echter alleen maar blijkbaar want de stelling van goedell zegt niet dat er een redeneertechniek is om te bewijzen dat iets geen logisch gevolg is van een theorie. In dat geval kan het zijn dat het algoritme helemaal niet eindigt.

Voor het automisch bewijzen van een stelling wordt er gebruik gemaakt van achterwaarts redeneren. Er wordt geprobeerd om de inconsistentie van het tegenovergestelde van een formule te bewijzen. Voor deze bewijzen wordt er gebruik gemaakt van modus ponens, unificatie, resolutie en normalisatie. 



[algo_depth_first]:afbeeldingen_samenvatting/algoritme_diepte_eerst.pdf
[algo_breadth_first]:afbeeldingen_samenvatting/algoritme_breedte_eerst.pdf
[algo_non-deterministic]:afbeeldingen_samenvatting/algoritme_nondeterministic.pdf
[algo_depth_limited]:afbeeldingen_samenvatting/algoritme_depth_limited.pdf
[algo_it_deepening]:afbeeldingen_samenvatting/algoritme_iterative_deepening.pdf
[algo_bidirectional]:afbeeldingen_samenvatting/algoritme_bidirectioneel.pdf
[algo_hillclimbing]:afbeeldingen_samenvatting/algoritme_hillclimbing.pdf
[algo_beamsearch]:afbeeldingen_samenvatting/algoritme_beamsearch.pdf
[probs_hillclimbing2]:afbeeldingen_samenvatting/problemen_hillclimbing2.pdf
[algo_greedy]:afbeeldingen_samenvatting/algoritme_greedy.pdf
[algo_uniform]:afbeeldingen_samenvatting/algoritme_uniforme_kost.pdf
[probs_uniform]:afbeeldingen_samenvatting/problemen_uniforme_kost.pdf
[algo_opt_uniform]:afbeeldingen_samenvatting/agloritme_optimaal_uniform.pdf
[algo_est_op_uniform]:afbeeldingen_samenvatting/agloritme_estimate_extended_optimaal_uniform.pdf
[algo_A*]:afbeeldingen_samenvatting/algoritme_A_ster.pdf
[algo_flimited]:afbeeldingen_samenvatting/algoritme_f_limited.pdf
[algo_ida]:afbeeldingen_samenvatting/algoritme_iterative_deepening_A_ster.pdf
[algo_finds]:afbeeldingen_samenvatting/algoritme_findS.pdf
[algo_dual_finds]:afbeeldingen_samenvatting/algoritme_dual_findS.pdf
[algo_version_spaces]:afbeeldingen_samenvatting/algoritme_version_spaces.pdf
[algo_version_spaces_2]:afbeeldingen_samenvatting/algoritme_version_spaces_2.pdf
[constraint_netwerk]:afbeeldingen_samenvatting/constraint_netwerk.png
[diagram_backjumping]:afbeeldingen_samenvatting/diagram_backjumping.pdf
[algoritme_backjumping]:afbeeldingen_samenvatting/algoritme_backjumping.pdf
[redundantie_backmarking]:afbeeldingen_samenvatting/redundantie_voor_backmarking.pdf
[algo_backmarking]:afbeeldingen_samenvatting/algoritme_backmarking.pdf
[algo_AC1]:afbeeldingen_samenvatting/algoritme_ac1.pdf
[algo_AC3]:afbeeldingen_samenvatting/algoritme_AC3.pdf