/**
 R2D: Raster to DXF
 
 This program loads a raster file (.gif, .jpg, .tga, .png, .bmp),
 convert it in b/w picture, and exports a .dxf file.
 A dxf line for every horizontal sequence of black pixels.
 Using filling, user can export not every dxf line.
 
 
 
 LICENSING:
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 */

/**
 Change notes:
 0.1 Identificazione dei punti del raster
 0.2 Tracciatura delle linee
 0.3 Interfaccia e preview
 0.4 Debug algoritmo
 0.5 Debug algoritmo e correzione specchiatura immagine
 0.6 Test matrice con indici semplificati
 0.7 Riempimento
 0.8 Clear, uso senza chiusura al termine, exported folder
 0.9 Bugfix
 */


/********************************************************************LIBRARIES*************************************************************************************/

import processing.dxf.*;

/****************************************************************GLOBAL VARIABLES*****************************************************************************************/

//Oggetto immagine
PImage img;

//matrice 2D dei pixel dell'immagine
int[][] matrix = new color[10000][10000];

//array composto da quattro punti in cui i primi due 
//sono le coordinate di partenza della linea e 
//gli ultimi due le coordinate di termine della linea
int[][] pts = new int[4][1000000];

//indice
int index_p = 0; 
int index_t = 0;

//soglia scala grigi per discriminare cosa inserire nel dxf
int soglia = 50;
int soglia_prev;

// filling
int filling = 1;

// path del file selezionato dall'utente
String url_file;

// estraggo dal path il nome del file 
String filename;


// richiesta di esportazione attraverso pulsante
boolean export_request = false;

boolean selection_done = false;
boolean selecting = false;

// elementi GUI
float zoom = 1;
float trans_x, trans_y;

/***********************************************************************START_UP**********************************************************************************/


void setup() {
  //necessario renderer P3D per esportazione .dxf
  size(960, 540, P3D);

  textAlign(CENTER);

  soglia_prev = soglia;
}

/************************************************************************LOOP****************************************************************************/

void draw() {
  background(255);



  //*********************************************************************************************************


  //devo attendere che l'utente abbia scelto il file da elaborare
  if ( url_file != null && selection_done == false) {


    img = loadImage(url_file);


    array2matrix();


    identificazione_pts();



    selection_done = true;
  } //end if file selected


  //*********************************************************************************************************






  if (selection_done == true && soglia != soglia_prev) {

    identificazione_pts();
  }




  //*********************************************************************************************************






  pushMatrix();

  //zoom utente e trascinamento
  scale(zoom);
  translate(trans_x, trans_y);

  translate(120, 120);
  
  if (selection_done){
  //preview dell'immagine risultante
  display();
  }
  
  
  popMatrix();


  //*********************************************************************************************************




  if (export_request) {

    // traccio una linea tra ogni punto di inizio e punto di fine
    // e quello che viene tracciato è registrato come dxf, e alla fine esportato

    //    filename = url_file.substring(url_file.indexOf('/'),url_file.indexOf(".") );
    //    println(filename);

    background(255);

    beginRaw(DXF, "./exported_DXFs/exported_"+year()+ "_" +nf(month(), 2)+ "_" +nf(day(), 2)+ "_" +nf(hour(), 2)+ "_" +nf(minute(), 2)+ "_" +nf(second(), 2)+".dxf"); 

    // a differenza della funzione display in questo caso specchio orizzontalmente
    display_specch();

    endRaw();
    //exit();
    
    
    export_request = false;
    selection_done = false;
  } // end richiesta esportazione



  //*********************************************************************************************************
  //update soglia
  soglia_prev = soglia;
  
  
  
  
  //*********************************************************************************************************




  //interfaccia grafica
  gui();




} //end draw