void pause () {
  //title
  fill (red);
  textSize (150);
  text ("PAUSED", 400, 400);
  
  //covers play button
  fill (0);
  noStroke ();
  rect (720, 720, 60, 60);
  
  //restart button
  tactileButton (67, 367, 475, 555);
  rect (67, 475, 300, 80);
  textSize (60);
  tactileText (67, 367, 457, 555);
  text ("RESTART", 217, 538);
  
  //back to menu button
  tactileButton (434, 734, 475, 555);
  rect (434, 475, 300, 80);
  tactileText (434, 734, 475, 555);
  text ("MENU", 584, 538);
  
  //resume button
  tactileButton (250, 550, 600, 680);
  rect (250, 600, 300, 80);
  tactileText (250, 550, 600, 680);
  text ("RESUME", 400, 663);
  
  println (mouseX, mouseY);
}

void pauseClick () {
  //if you click on resume
  if (mouseX>250 && mouseX<550 && mouseY>600 && mouseY<680) {
    mode=game;
    click ();
  }
  
  //if you click restart
  if (mouseX>67 && mouseX<367 && mouseY>475 && mouseY<555) {
    restart ();
    mode=game;
    paddleX=width/2;
    click ();
  }
  
  //if you click on menu
  if (mouseX>434 && mouseX<734 && mouseY>475 && mouseY<555) {
    restart ();
    mode=intro;
    click ();
  }
}

void restart () {
  lives=5;
  points=0;
  for (int i=0; i<=brickNumber-1; i+=1) {
    hit [i]=false;
  }
  ballX=400;
  ballY=400;
  vy=10;
  vx=0;
}
