/*********************************************
 * OPL 12.5.1.0 Model
 * Author: Stijn
 * Creation Date: 16-dec.-2015 at 15:14:14
 *********************************************/
 

 
 dvar float winst;
 dvar float+ reclameHuis;
 dvar float+ reclameBenz;
 dvar float+ mengen[1..2][1..2];
 /* mengen[huisbrandolie/benzine][olie1/olie2] */
 
 maximize winst;
 
 subject to {
   winst == 75 * sum(i in 1..2)(mengen[2][i]) + 60 * sum(i in 1..2)(mengen[1][i]) - reclameBenz - reclameHuis;
   sum(i in 1..2)(mengen[1][i]) <= 10 * reclameHuis;
   sum(i in 1..2)(mengen[2][i]) <= 5 * reclameBenz;
   
   (10 * mengen[1][1] + 2 * mengen[1][2]) >= 6 * sum(i in 1..2)(mengen[1][i]);
   (10 * mengen[2][1] + 2 * mengen[2][2]) >= 8 * sum(i in 1..2)(mengen[2][i]);
     
   sum(i in 1..2)(mengen[i][1]) <= 5000;
   sum(i in 1..2)(mengen[i][1]) <= 10000;
 }