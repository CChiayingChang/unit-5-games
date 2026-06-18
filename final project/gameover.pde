void gameover () {
  background.pause ();
  win.play ();
  
  image (trophy, 0, 0, width, height);
  fill (0, 150);
  rect (0, 0, width, height);
  textSize (200);
  fill (white);
  text ("YOU WIN!", 450, 350);
  
  println (mouseX, mouseY);
  
  //restart button
  tactileButton (37, 287, 500, 575);
  rect (37, 500, 250, 75);
  fill (white);
  text ("RESTART", 162, 540);
  
  //map button
  tactileButton (324, 574, 500, 575);
  rect (324, 500, 250, 75);
  fill (white);
  text ("MAP", 449, 540);
  
  //exit button
  tactileButton (613, 863, 500, 575);
  rect (613, 500, 250, 75);
  fill (white);
  text ("EXIT", 738, 540);
  
  textSize (55);
  text ("Deaths:"+deaths, 450, 625);
}

void gameoverClick () {
  if (mouseX>37 && mouseX<287 && mouseY>500 && mouseY<575) {//if you click on restart
    mode=intro;
    level2=false;
    level3=false;
    deaths=0;
    win.rewind ();
    click ();
  }
  if (mouseX>324 && mouseX<574 && mouseY>500 && mouseY<575) {
    mode=map;
    win.rewind ();
    click ();
  }
  if (mouseX>613 && mouseX<863 && mouseY>500 && mouseY<575) {
    exit ();
    click ();
  }
}
