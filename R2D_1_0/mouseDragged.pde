void mouseDragged() 
{
  if (mouseButton == CENTER) {
    trans_x = trans_x +  2*(mouseX - pmouseX);
    trans_y = trans_y +  2*(mouseY - pmouseY);
  }
}