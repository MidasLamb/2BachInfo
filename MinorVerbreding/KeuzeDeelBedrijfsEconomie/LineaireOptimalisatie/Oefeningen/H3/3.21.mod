/*********************************************
 * OPL 12.5.1.0 Model
 * Author: Stijn
 * Creation Date: 16-dec.-2015 at 20:27:36
 *********************************************/
 int nbAfdelingen = ...;
 range afdelingen = 1 .. nbAfdelingen;
 
 int nbDelen = ...;
 range delen = 1 .. nbDelen;
 
 int productieritme[afdelingen][delen] = ...;
 int capaciteit[afdelingen] = ...;
 
 dvar float+ uren[afdelingen];
 dvar float+ verschil[delen][delen];
 
 dvar float totaalVerschil;
 
 minimize totaalVerschil;
 
 subject to {
   totaalVerschil == sum(d in delen, e in delen)(verschil[d][e]);
   
   forall(d in delen, e in delen) {
     verschil[d, e] >= sum(a in afdelingen)(uren[a] * (productieritme[a][d] - productieritme[a][e]));
   } 
   
   forall(a in afdelingen) {
     uren[a] <= capaciteit[a];
   }
   
   forall(d in delen) {
     sum(a in afdelingen)(productieritme[a][d] * uren[a]) >= 1000;
   }     
 }