void mousePressed () {
  if (mode==intro) {
    introClick ();
  } else if (mode==options) {
    optionsClick ();
    slider ();
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
