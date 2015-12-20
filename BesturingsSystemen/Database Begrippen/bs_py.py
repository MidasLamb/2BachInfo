import csv
from random import randint


db  = open('bs_db.csv', "rb")
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
    trigger = raw_input("")

    if trigger != 'stop':
        the_chosen_one = randint(0,lstlen-1)
        print("Uit "+ lst[the_chosen_one][0]+", wat weet je over "+lst[the_chosen_one][1]+"?")

        inp = raw_input("")
        if inp == stop:
            break

        print("Uitleg uit de database: ", lst[the_chosen_one][2])

    else:
        break
