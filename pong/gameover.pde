void gameover () {
  background (0);
  textSize (150);
  fill (255);
  if (leftscore>rightscore) {
    text ("LEFT WIN", width/2, height/2);
  } else if (rightscore>leftscore) {
    text ("RIGHT WIN", width/2, height/2);
  }
  
  textSize (50);
  tactilebutton (375, 625, 500, 575, 375, 500, 250, 75);
  tactiletext (375, 625, 500, 575);
  text ("RESTART", 500, 550);
  
  println (mouseX, mouseY);
  
  //audio
  win.play ();
}

void gameoverClick () {
  if (mouseX>375 && mouseX<625 && mouseY>500 && mouseY<575) {
    mode=intro;
    leftscore=0;
    rightscore=0;
    click ();
    randomDirection ();
  }
}
