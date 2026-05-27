void gameover () {
  background (0);
  fill (255);
  textSize (100);
  if (lives==0) {
    text ("YOU LOSE", 400, 400);
  } else if (points==90) {
    text ("YOU WIN", 400, 400);
  }
  
  //restart button
  tactileButton (150, 350, 475, 535);
  rect (150, 475, 200, 60);
  textSize (50);
  tactileText (150, 350, 475, 535);
  text ("RESTART", 250, 520);
  
  
  //exit button
  tactileButton (450, 650, 475, 535);
  rect (450, 475, 200, 60);
  tactileText (450, 650, 475, 535);
  text ("EXIT", 550, 520);
  
  println (mouseX, mouseY);
}

void gameoverClick () {
  //if you click restart
  if (mouseX>150 && mouseX<350 && mouseY>475 && mouseY<535) {
    restart ();
    mode=intro;
  }
  
  //if you click on exit
  if (mouseX>450 && mouseX<650 && mouseY>475 && mouseY<535) {
    exit ();
  }
}
