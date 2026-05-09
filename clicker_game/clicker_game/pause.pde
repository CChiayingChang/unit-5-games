void pause () {
  //don't do any background or anything here-->it will freeze the screen on the last image left behnd of the game
  play (720, 720);
  textSize (150);
  text ("PAUSED", 400, 300);
}

void pauseClick () {
  if (dist (mouseX, mouseY, 720, 720)<25) {
    mode=game;
  }
}

void play (int x, int y) {
  pushMatrix ();
    translate (x, y);
    fill (0);
    stroke (yellow);
    strokeWeight (5);
    circle (0, 0, 50);
    fill (yellow);
    noStroke ();
    triangle (-7, -10, 13, 0, -7, 10);
  popMatrix ();
}

//control music volume? restart game, change music?
