void pause () {
  //don't do any background or anything here-->it will freeze the screen on the last image left behnd of the game
  play (720, 720);//play button
  textSize (150);
  text ("PAUSED", 400, 300);
  //leftbutton
  tactilebutton (100, 350, 450, 550);
  rect (100, 450, 250, 100, 10);
  tactiletext (100, 350, 450, 550);
  textSize (35);
  text ("BACK TO MENU", 225, 500);
  //right button
  tactilebutton (450, 700, 450, 550);
  rect (450, 450, 250, 100, 10);
  tactiletext (450, 700, 450, 550);
  text ("RESTART", 575, 500);
  println (mouseX, mouseY);
  
}

void pauseClick () {
  if (dist (mouseX, mouseY, 720, 720)<25) {
    mode=game;
  }
  if (mouseX>100 && mouseX<350 && mouseY>450 && mouseY<550) {
    mode=intro;
  }
  if (mouseX>4550 && mouseX<700 && mouseY>450 && mouseY<550); {
    mode=game;
    lives=3;
    score=0;
  }
  
}

void play (int x, int y) {//play button
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

//control music volume? change music?
//make it so when you restart it the highscore doesn't save the score before you restart
