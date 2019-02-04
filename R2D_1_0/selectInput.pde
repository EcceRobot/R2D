void fileSelected(File selection) {



  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    selecting = false;
  } else {
    println("User selected " + selection.getAbsolutePath());
    url_file=selection.getAbsolutePath();
    selecting = false;
  }
}