void array2matrix() {

  //traspongo i pixel da un array 1D a un array 2D
  for (int i = 0; i < img.pixels.length; i++) {

    matrix[1+ i%img.width][1+floor(i/img.width)] = img.pixels[i];
  }
}