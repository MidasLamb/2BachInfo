/*********************************************
 * OPL 12.5.1.0 Model
 * Author: Stijn
 * Creation Date: 15-dec.-2015 at 20:48:24
 *********************************************/

 int nbLegeringen = 2;
 int nbMetalen = 4;
 int nbErtsen = 3;
 
 range legeringen = 1..nbLegeringen;
 range metalen = 1..nbMetalen;
 range ertsen = 1..nbErtsen;
 
 dvar float+ mengen[legeringen, metalen];
 dvar float+ erts[ertsen];
 int kostErts[1..3] = [900, 1200, 1500];
 
 dvar float winst;

 maximize winst;
 
 subject to {
   
   winst == -sum(i in ertsen)(kostErts[i]*erts[i]) + 8000*(sum(m in metalen)(mengen[1, m])) + 9000*(sum(m in metalen)(mengen[2, m]));
      
   sum(m in metalen)(mengen[1, m]) >= 1000;
   sum(m in metalen)(mengen[2, m]) >= 2000;
   
   forall(i in ertsen) {
     erts[i] <= 2000;
   } 
   
   mengen[1, 1] <= 0.10 * (sum(m in metalen)(mengen[1, m]));
   mengen[1, 2] <= 0.10 * (sum(m in metalen)(mengen[1, m]));
   mengen[1, 4] >= 0.25 * (sum(m in metalen)(mengen[1, m]));
   
   mengen[2, 2] >= 0.10 * (sum(m in metalen)(mengen[2, m]));
   mengen[2, 3] >= 0.35 * (sum(m in metalen)(mengen[2, m]));
   mengen[2, 4] <= 0.25 * (sum(m in metalen)(mengen[2, m]));
   
   mengen[1,1] + mengen[2, 1] <= 0.20*erts[1] + 0.10*erts[2] + 0.05*erts[3];
   mengen[1,2] + mengen[2, 2] <= 0.10*erts[1] + 0.20*erts[2] + 0.05*erts[3];
   mengen[1,3] + mengen[2, 3] <= 0.30*erts[1] + 0.30*erts[2] + 0.70*erts[3];
   mengen[1,4] + mengen[2, 4] <= 0.30*erts[1] + 0.30*erts[2] + 0.20*erts[3];
 }