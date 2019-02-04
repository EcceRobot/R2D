// la funzione identifica gli estremi di ogni linea orizzontale che è possibile definire nel raster, 
// e li appoggia sull'array 2D pts[4][10000]


void identificazione_pts() {

  // scansiono tutti i punti, e appena trovo un pixel scuro preceduto da uno chiaro dichiaro quel punto come partenza di un segmento

  index_p = 0;

  for (int n = 0; n < img.height; n++) {

    for (int m = 1; m <= img.width; m++) {
      //l'array in effetti parte da 0, questa ultima condizione mi serve per non analizzare gli elementi a indice m=0
      if (matrix[m][n] <= color(soglia) && ( m==1 || (matrix[m-1][n]>color(soglia) && m!=1) ) ) {

        pts[0][index_p] = m;
        pts[1][index_p] = n;
        index_p++;
      }
    }
  }


  // scansiono tutti i punti, e appena trovo un pixel scuro seguito da uno chiaro dichiaro quel punto come termine di un segmento

  index_t=0;

  for (int n = 0; n < img.height; n++) {

    for (int m = 1; m <= img.width; m++) {


      if (matrix[m][n] <= color(soglia) && ( matrix[m+1][n]>color(soglia)  || m==img.width)) {

        pts[2][index_t] = m+1;
        pts[3][index_t] = n;
        index_t++;
      }
    }
  }




  //**************************************************************************************************************
}