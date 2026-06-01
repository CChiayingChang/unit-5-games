void gameover () {
  lives=0;
  background (0);
  fill (255);
  textSize (100);
  if (lives==0) {
    text ("YOU LOSE", 400, 400);
    lose.play ();
    whichFlose=whichFlose+1;//goes through all the frame numbers
    if (whichFlose==fNumLOSE) whichFlose=0;//if it gets to the last frame, start from the first frame
    image (loseGif [whichFlose], 100, 400, 275, 275);
  } else if (points==90) {
    text ("YOU WIN", 400, 400);
    win.play ();
    image (winGif [whichFwin], 0, 0, width, height);
    whichFwin+=1;
    if (whichFwin==fNumWIN) whichFwin=0;
  }
  
  //restart button
  tactileButton (150, 350, 675, 735);
  rect (150, 675, 200, 60);
  textSize (50);
  tactileText (150, 350, 675, 735);
  text ("RESTART", 250, 720);
  
  
  //exit button
  tactileButton (450, 650, 675, 735);
  rect (450, 675, 200, 60);
  tactileText (450, 650, 675, 735);
  text ("EXIT", 550, 720);
  
  println (mouseX, mouseY);
}

void gameoverClick () {
  //if you click restart
  if (mouseX>150 && mouseX<350 && mouseY>675 && mouseY<735) {
    restart ();
    mode=intro;
    click ();
    lose.rewind ();
    win.rewind ();
  }
  
  //if you click on exit
  if (mouseX>450 && mouseX<650 && mouseY>675 && mouseY<735) {
    exit ();
    click ();
  }
}
