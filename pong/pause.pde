void pause () {
  println (mouseX, mouseY);
  fill (255);
  textSize (150);
  text ("PAUSED", 500, 300);
  
  //get rid of small pasue button
  fill (0);
  noStroke ();
  rect (895, 595, 60, 60);
  
  //resume button
  noFill ();
  textSize (50);
  tactilebutton (150, 350, 430, 505, 150, 430, 200, 75);
  tactiletext (150, 350, 430, 505);
  text ("RESUME", 250, 485);
  
  //restart button
  tactilebutton (400, 600, 430, 505, 400, 430, 200, 75);
  tactiletext (400, 600, 430, 505);
  text ("RESTART", 500, 485);
  
  //menu button
  tactilebutton (650, 850, 430, 505, 650, 430, 200, 75);
  tactiletext (650, 850, 430, 505);
  text ("MENU", 750, 485);
}

void pauseClick () {
  if (mouseX>150 && mouseX<350 && mouseY>430 && mouseY<505) {//if you click on resume
    mode=game;
    click ();
  }
  if (mouseX>400 && mouseX<600 && mouseY>430 && mouseY<505) {//if you click on restart
    leftscore=0;
    rightscore=0;
    ballX=500;
    ballY=350;
    mode=game;
    randomDirection ();
    timer=100;
    click ();
  }
  if (mouseX>650 && mouseX<850 && mouseY>430 && mouseY<505) {//if you click on menu
    leftscore=0;
    rightscore=0;
    ballX=width/2;
    ballY=height/2;
    randomDirection ();
    mode=intro;
    click ();
  }
}

//add restart. back to menu, resume
