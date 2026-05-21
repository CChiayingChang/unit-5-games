void mousePressed () {
  if (mode==intro) introClick ();
  else if (mode==options) optionsClick ();
  else if (mode==game) gameClick ();
  else if (mode==pause) pauseClick ();
  else if (mode==gameover) gameoverClick ();
}
