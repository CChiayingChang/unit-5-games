void mousePressed () {
  if (mode==intro) {
    introClick ();
  } else if (mode==options) {
    optionsClick ();
    slider ();
    //put the slider cicking in mousepressed so it clicks only once
    if (dist(mouseX, mouseY, 100, sliderY) <13 && mode==options && mouseY>220 && mouseY<575) {
    click ();
  }
  if (dist (mouseX, mouseY, 380, sliderY2) <13 && mode==options && mouseY>220 && mouseY<575) {
    click ();
  }
  } else if (mode==game) {
    gameClick ();
  } else if (mode==pause) {
    pauseClick ();
  } else if (mode==gameover) {
    gameoverClick ();
  } else {
    println ("Error: Mode = " + mode);
  }
}
