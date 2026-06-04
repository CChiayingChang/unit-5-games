void map () {
  background (black);
  level (100, 200, 100);
}

void mapClick () {

}

void level (boolean level, int x, int y, int d) {
  //if you haven't completed the level yet, it's grey and inaccessible
  if (level==true) fill (red);
  else fill (grey);
  circle (x, y, d);
  if (mouseX>x-d/2 && mouseX<x+d/2 && mouseY>y-d/2 && mouseY<y+d/2)
}
