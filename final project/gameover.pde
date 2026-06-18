void gameover () {
  background.pause ();
  win.play ();
  
  image (trophy, 0, 0, width, height);
  fill (0, 180);
  noStroke ();
  rect (0, 0, width, height);
  textSize (200);
  fill (139, 13, 13);
  text ("YOU WIN!", 460, 360);
  fill (red);
  text ("YOU WIN!", 450, 350);
  
  println (mouseX, mouseY);
  
  //restart button
  noStroke ();
  fill (139, 13, 13);
  rect (47, 560, 250, 75);
  tactileButton (37, 287, 550, 625);
  rect (37, 550, 250, 75);
  fill (white);
  text ("RESTART", 162, 590);
  
  //map button
  noStroke ();
  fill (139, 13, 13);
  rect (334, 560, 250, 75);
  tactileButton (324, 574, 560, 625);
  rect (324, 550, 250, 75);
  fill (white);
  text ("MAP", 449, 590);
  
  //exit button
  noStroke ();
  fill (139, 13, 13);
  rect (623, 560, 250, 75);
  tactileButton (613, 863, 550, 625);
  rect (613, 550, 250, 75);
  fill (white);
  text ("EXIT", 738, 590);
  
  textSize (55);
  text ("Deaths:"+deaths, 450, 485);
}

void gameoverClick () {
  if (mouseX>37 && mouseX<287 && mouseY>550 && mouseY<625) {//if you click on restart
    mode=intro;
    level2=false;
    level3=false;
    deaths=0;
    win.rewind ();
    click ();
  }
  if (mouseX>324 && mouseX<574 && mouseY>550 && mouseY<625) {
    mode=map;
    win.rewind ();
    click ();
  }
  if (mouseX>613 && mouseX<863 && mouseY>550 && mouseY<625) {
    exit ();
    click ();
  }
}
