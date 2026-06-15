void game3 () {
  background (0);
  level3=true;//for the clickable circles on the map
  progress=3;//tracks what mode to return to for pause screen
  
  fill (white);
  textSize (50);
  text ("LEVEL 3", 450, 50);
  
  menu ();
}

void game3Click () {
  if (mouseX>845 && mouseX<875 && mouseY>25 && mouseY<45) {//if you click on menu
    mode=pause;
    fill (black, 150);
    rect (0, 0, width, height);
  }
}
