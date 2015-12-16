/*********************************************
 * OPL 12.5.1.0 Model
 * Author: Stijn
 * Creation Date: 11-dec.-2015 at 21:01:36
 *********************************************/

 /** VRAAG: 4000 | 2000 | 3000 | 10000 */
 
 /** VARIABELEN: werknemers in dienst die niet werken in een periode, voorraad
 *	minimaliseer de kosten: aantal werknemers zo laag mogelijk, zo klein mogelijke opslag
 */
 
int nrPeriodes = ...;
range periodes = 1..nrPeriodes;

dvar float+ werknemersVerlof[periodes];
dvar float+ voorraad[periodes];

int vraag[periodes] = ...;

minimize 8000 * sum(p in periodes)(werknemersVerlof[p]) + 5 * sum(p in periodes)(voorraad[p]);



subject to {
	500 * (sum(q in periodes)(werknemersVerlof[q]) - werknemersVerlof[1]) + 1000 - vraag[1] == voorraad[1];
  	forall(p in 2..nrPeriodes) {
  		500 * (sum(q in periodes)(werknemersVerlof[q]) - werknemersVerlof[p]) + voorraad[p-1] - vraag[p] == voorraad[p];
   	}  	  
  
//  	500 * (werknemersVerlof[2] + werknemersVerlof[3] + werknemersVerlof[4]) + 1000 - vraag[1] == voorraad[1];
//  	500 * (werknemersVerlof[1] + werknemersVerlof[3] + werknemersVerlof[4]) + voorraad[1] - vraag[2] == voorraad[2];
//  	500 * (werknemersVerlof[1] + werknemersVerlof[2] + werknemersVerlof[4]) + voorraad[2] - vraag[3] == voorraad[3];
//  	500 * (werknemersVerlof[1] + werknemersVerlof[2] + werknemersVerlof[3]) + voorraad[3] - vraag[4] == voorraad[4];
}