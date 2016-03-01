/*********************************************
 * OPL 12.5.1.0 Model
 * Author: Stijn
 * Creation Date: 16-dec.-2015 at 15:48:29
 *********************************************/

int nbInspecteurs = ...;
range inspecteurs = 1..nbInspecteurs;

dvar float+ werkuren[inspecteurs];
float uurloon[inspecteurs] = ...;
float snelheid[inspecteurs] = ...;
float accuraatheid[inspecteurs] = ...;

dvar float kost;

minimize kost;

subject to {
	kost == sum(i in inspecteurs)(uurloon[i] * werkuren[i]);
	
	sum(i in inspecteurs)(werkuren[i]) <= 8;
	sum(i in inspecteurs)(werkuren[i] * snelheid[i]) >= 1800;
	forall(i in inspecteurs) {
		werkuren[i] <= 4;
	}
	
	sum(i in inspecteurs)(werkuren[i] * snelheid[i] * accuraatheid[i]) >= 0.98 * sum(i in inspecteurs)(werkuren[i] * snelheid[i]);
}