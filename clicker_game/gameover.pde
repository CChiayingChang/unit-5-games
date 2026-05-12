void gameover () {
  image (abstracted, 400, 400, width, height);
  fill (0, 200);
  noStroke ();
  rect (0, 0, width, height);
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
  tactilebutton (215, 585, 570, 660);
  rect (215, 570, 370, 90);
  tactiletext (215, 585, 570, 660);
  textSize (80);
  text ("RESTART", 400, 615);
}

void gameoverClick () {
  if (mouseX>215 && mouseX<585 && mouseY>570 && mouseY<660) {
    mode=intro;
    lives=3;//resets lives--> don't forget, or else when you start the game the lives will be 0 and youll be sent automatically back to gameover page
    score=0;
    slider=570;
    vx=random (5*cos(a));//generates random x angle
    vy=random (5*sin(a));//generates random y angle
  } else {
    mode=gameover;//if i don't add this for some reason if i click anywhere it automatially takes me back to intro screen
  }
}
