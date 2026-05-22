void gameover () {
  backgroundMusic.pause ();
  background (0);
  outline ();
  textSize (150);
  fill (255);
  if (leftscore>rightscore) {
    text ("LEFT WIN", width/2, height/2);
  } else if (rightscore>leftscore) {
    text ("RIGHT WIN", width/2, height/2);
  }
  
  //restart button
  textSize (50);
  tactilebutton (237, 487, 500, 575, 237, 500, 250, 75);
  tactiletext (237, 487, 500, 575);
  text ("RESTART", 370, 550);
  
  //exit button
  tactilebutton (512, 762, 500, 575, 512, 500, 250, 75);
  tactiletext (512, 762, 500, 575);
  text ("EXIT", 637, 550);
  
  println (mouseX, mouseY);
  
  //audio
  win.play ();
}

void gameoverClick () {
  if (mouseX>375 && mouseX<625 && mouseY>500 && mouseY<575) {//if you click on restart button
    mode=intro;
    leftscore=0;
    rightscore=0;
    click ();
    randomDirection ();
    backgroundMusic.rewind ();
  }
  if (mouseX>512 && mouseX<762 && mouseY>500 && mouseY<575) {
    click ();
    exit ();
  }
}
