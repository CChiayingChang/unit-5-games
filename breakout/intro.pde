void intro () {
  println (mouseX, mouseY);
  
  lose.pause ();//resests win and lose audio for next time
  lose.rewind ();
  win.pause ();
  win.rewind ();
  
  background (0);
  textSize (100);
  fill (255);
  text ("BREAKOUT", 400, 400);
  
  //start button
  tactileButton (300, 500, 500, 575);
  rect (300, 500, 200, 75);
  fill (0);
  textSize (50);
  tactileText (300, 500, 500, 575);
  text ("START", 400, 555);
}

void introClick () {
  if (mouseX>300 && mouseX<500 && mouseY>500 && mouseY<575) {
    mode=game;
    click ();
  }
}
