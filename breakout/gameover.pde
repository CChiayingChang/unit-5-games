void gameover () {
  textSize (130);
  if (lives==0) {
    image (disappointed, 0, 0, width, height);
    fill (0, 150);
    rect (0, 0, width, height);
    fill (red);
    text ("YOU LOSE", 400, 400);
    lose.play ();
  } else if (points==90) {
    image (trophy, 0, 0, width, height);
    fill (0, 150);
    rect (0, 0, width, height);
    fill (red);
    text ("YOU WIN", 400, 400);
    win.play ();
    image (winGif [whichFwin], 0, 0, width, height);
    whichFwin+=1;
    if (whichFwin==fNumWIN) whichFwin=0;
  }
  
  //restart button
  tactileButton (105, 430, 480, 565);
  rect (105, 480, 325, 85);
  textSize (65);
  tactileText (105, 430, 480, 565);
  text ("RESTART", 268, 550);
  
  
  //exit button
  tactileButton (505, 695, 480, 565);
  rect (505, 480, 190, 85);
  tactileText (505, 695, 480, 565);
  text ("EXIT", 600, 550);
  
  println (mouseX, mouseY);
}

void gameoverClick () {
  //if you click restart
  if (mouseX>105 && mouseX<430 && mouseY>480 && mouseY<565) {
    restart ();
    mode=intro;
    click ();
    lose.rewind ();
    win.rewind ();
  }
  
  //if you click on exit
  if (mouseX>505 && mouseX<695 && mouseY>480 && mouseY<565) {
    exit ();
    click ();
  }
}
