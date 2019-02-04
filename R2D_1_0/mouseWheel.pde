void mouseWheel(MouseEvent event) {
  //se sono nella zona dell'anteprima, voglio utilizzare lo scroll per definire i valori senza cambiare per questo lo zoom
  if (mouseX>120) {
    float e = event.getCount();
    zoom = zoom - e/80;
  }
}