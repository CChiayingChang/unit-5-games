void mouseReleased () {
  if (mode==intro) {
    introClick ();
  } else if (mode==option) {//the if else acts as a chain--> if it meets one condition, it won't check for the other conditions, so theres only ever one screen
    optionClick ();
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
