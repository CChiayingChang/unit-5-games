void intro () {
  image (zoom [whichzoom], 0, 0, width, height);
  whichzoom+=2;
  if (whichzoom==frameszoom) whichzoom=0;
  fill (0, 150);
  noStroke ();
  rect (0, 0, width, height);
  background.rewind ();
  background.play ();
  println (mouseX, mouseY);
  
  lose.pause ();//resests win and lose audio for next time
  lose.rewind ();
  win.pause ();
  win.rewind ();
  
  textSize (125);
  fill (red);
  text ("BREAKOUT", 400, 400);
  
  //start button
  tactileButton (215, 585, 500, 617);
  rect (215, 500, 370, 117);
  fill (0);
  textSize (100);
  tactileText (215, 585, 500, 617);
  text ("START", 400, 600);
}

void introClick () {
  if (mouseX>215 && mouseX<585 && mouseY>500 && mouseY<617) {
    mode=game;
    click ();
  }
}
