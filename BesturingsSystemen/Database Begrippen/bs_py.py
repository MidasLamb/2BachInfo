# Door Dries De Proost
# Een CLI script dat de begrippen van BS ondervraagt en een modelantwoord.
# Er is een database met begrippen en modelantwoorden nodig. Er is een in de repo.
# De nieuwste versie van de database wordt bijgehouden in de volgende Google Docs Spreadsheet: 
# https://goo.gl/GxMnQq (help gerust met deze aan te vullen)!.
# Download de spreadsheet als .csv en vervang bs_db.csv uit de repo ermee.

# Suggesties voor verbetering van dit script:
#   - duidelijkere print formatting
#   - een mode aanbieden die er voor zorgt dat al
#     beantwoorde begrippen niet opnieuw gevraagd worden
#     tot dat elk begrip een keer beantwoord is.
#	- een readme.md maken ipv deze comments.

import csv
from random import randint


db = open('bs_db.csv', 'r')
reader = csv.reader(db)
lst = []


for row in reader:
    tmp = []
    for el in row:
        tmp.append(el)
    lst.append(tmp)


lstlen=len(lst)
stop='stop'
print("Geef 'stop' in om te stoppen, iets anders voor een nieuw begrip")
while True:
    trigger = input("")

    if trigger != 'stop':
        the_chosen_one = randint(0,lstlen-1)
        print("Uit "+ lst[the_chosen_one][0]+", wat weet je over "+lst[the_chosen_one][1]+"?")

        inp = input("")
        if inp == stop:
            break

        print("Uitleg uit de database: ", lst[the_chosen_one][2])

    else:
        break

