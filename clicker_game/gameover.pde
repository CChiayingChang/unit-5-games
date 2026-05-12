void gameover () {
  //background image
  image (abstracted, 400, 400, width, height);
  fill (0, 200);
  noStroke ();
  rect (0, 0, width, height);
  //text
  textSize (100);
  theme.pause ();
  lose.play ();
  fill (yellow);
  text ("GAMEOVER", 400, 300);
  textSize (50);
  text ("Score:" + score, 400, 400);
  if (score>highscore && lives==0) {//only activates when lives=0, so if you pause the game and restart or go back to intro, the highscore doesn't count
    highscore=score;
  }
  text ("Highscore:" + highscore, 400, 500);
  println  (mouseX, mouseY);
  //option buttons
  //restart button
  tactilebutton (100, 350, 570, 660);
  rect (100, 570, 250, 90, 10);
  tactiletext (100, 350, 570, 660);
  textSize (50);
  text ("RESTART", 225, 615);
  
  
  //exit button
  tactilebutton (450, 700, 570, 660);
  rect (450, 570, 250, 90, 10);
  tactiletext (450, 700, 570, 660);
  text ("EXIT", 575, 615);
}

void gameoverClick () {
  if (mouseX>100 && mouseX<350 && mouseY>570 && mouseY<660) {//when you click on the restart button
    mode=intro;
    lives=3;//resets lives--> don't forget, or else when you start the game the lives will be 0 and youll be sent automatically back to gameover page
    score=0;
    slider=570;
    vx=random (5*cos(a));//generates random x angle
    vy=random (5*sin(a));//generates random y angle
  } else if (mouseX>450 && mouseX<700 && mouseY>570 && mouseY<660) {
    exit ();//this makes the window close
  }
}
