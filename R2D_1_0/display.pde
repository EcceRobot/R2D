// mette a schermo tutte le linee orizzontali identificate i cui estremi sono contenuti in pts[][]


void display() {
  for (int index=0; index<index_p; index++) {
    // se la linea che sto per mettere a schermo è multiplo del riempimento scelto, allora eseguo, alrimenti la salto
    if (pts[1][index]%filling==0 && pts[3][index]%filling==0) { 
      line(pts[0][index], pts[1][index], pts[2][index], pts[3][index]);
    }
  }
}


//considerndo la disposizione degli assi cartesiani in Processing sono costretto a specchiare orizzontalmente
// infatti quando uso la funzione display() per poi estrarre il dxf se non inverto il file risulta "sotto-sopra"


void display_specch() {
  for (int index=0; index<index_p; index++) {
    // se la linea che sto per mettere a schermo è multiplo del riempimento scelto, allora eseguo, alrimenti la salto
    if (pts[1][index]%filling==0 && pts[3][index]%filling==0) { 
      line(pts[0][index], -pts[1][index], pts[2][index], -pts[3][index]);
    }
  }
}