// si occupa di tutta l'interfaccia grafica dell'applicazione

void gui() {
  
  pushStyle();
  fill(240);
  noStroke();
  rect(0,0,width/2,height/2);
  rect(width/2,height/2,width/2,height/2);
  popStyle();
  
  //***************************************SELECT FILE**********************************************************************
  
  fill(250);
  rect(10, 10, 100, 20);
  fill(0);
  text("select file", 10, 10, 100, 20);
  //vedi funzione mousePressed()

  //***********************************************CLEAR***************************************************************

  fill(250);
  rect(10, 35, 100, 20);
  fill(0);
  text("clear", 10, 35, 100, 20);
  //vedi funzione mousePressed()

  //***********************************************EXPORT***************************************************************

  fill(250);
  rect(10, 60, 100, 20);
  fill(0);
  text("export", 10, 60, 100, 20);

  //********************************************GRAYSCALE******************************************************************

  fill(250);
  rect(25, 85, 70, 20);
  rect(10, 85, 10, 20);
  rect(100, 85, 10, 20);
  fill(0);

  text("gray : " + str(soglia), 25, 85, 70, 20);
  text("-", 10, 85, 10, 20);
  text("+++++", 100, 85, 10, 20);

  if (mousePressed && mouseX> 10 && mouseX<10+10 && mouseY>85 && mouseY< 85+20 && soglia>0) {
    soglia--;
    delay(80);
  }

  if (mousePressed && mouseX> 100 && mouseX<100+10 && mouseY>85 && mouseY< 85+20 && soglia<255) {
    soglia++;
    delay(80);
  }


  //*************************************************FILLING*************************************************************

  fill(250);
  rect(25, 110, 70, 20);
  rect(10, 110, 10, 20);
  rect(100, 110, 10, 20);
  fill(0);

  text("fill : " + str(filling), 25, 110, 70, 20);
  text("-", 10, 110, 10, 20);
  text("+++++", 100, 110, 10, 20);

  if (mousePressed && mouseX> 10 && mouseX<10+10 && mouseY>110 && mouseY< 110+20 && filling>1) {
    filling--;
    delay(80);
  }

  if (mousePressed && mouseX> 100 && mouseX<100+10 && mouseY>110 && mouseY< 110+20 && filling<10) {
    filling++;
    delay(80);
  }



  //**********************************************QUIT***************************************************************

  fill(250);
  rect(10, 135, 100, 20);
  fill(0);
  text("quit", 10, 135, 100, 20);
  if (mousePressed && mouseX> 10 && mouseX<10+100 && mouseY>135 && mouseY< 135+20) {
    exit();
  }



  //**********************************************HELP***************************************************************
  /*
  fill(250);
  rect(10, 160, 100, 20);
  fill(0);
  text("help", 10, 160, 100, 20);
  if (mousePressed && mouseX> 10 && mouseX<10+100 && mouseY>160 && mouseY< 160+20) {
    println("help");
  }
  */
  //*****************************************************************************
  

  
}