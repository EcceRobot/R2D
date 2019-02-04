//devo utilizzare mousePressed() quando sevo essere sicuro che venga visto solo il fronte sul pulsante
// e che se tengo giù il pulsante il comando ad esso legato non abbia effetto

void mousePressed() {

  //select file button
  if ( mouseX>10 && mouseX<10+100 && mouseY>10 && mouseY<10+20 && !selecting && !selection_done) {
    selecting = true;
    selectInput("Select a raster image file", "fileSelected");
  }

  //clear button
  if ( mouseX>10 && mouseX<10+100 && mouseY>35 && mouseY<35+20 && !selecting && selection_done) {
    selection_done =false;
    url_file = null;
    println("Clear");

    //*****************************
    
    
  }


  // export request button
  if (mouseX>10 && mouseX<10+100 && mouseY>60 && mouseY<60+20 && selection_done) {
    export_request = true;
  }
}