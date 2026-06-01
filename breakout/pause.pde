void pause () {
  //play button
  fill (255);
  textSize (100);
  text ("PAUSED", 400, 400);
  tactileButton (725, 775, 725, 775);
  fill (0);
  rect (725, 725, 50, 50);
  strokeWeight (5);
  tactileText (725, 775, 725, 775);
  triangle (740, 740, 740, 760, 760, 750);
  
  //restart button
  tactileButton (150, 350, 475, 535);
  rect (150, 475, 200, 60);
  textSize (50);
  tactileText (150, 350, 475, 535);
  text ("RESTART", 250, 520);
  
  
  //back to menu button
  tactileButton (450, 650, 475, 535);
  rect (450, 475, 200, 60);
  tactileText (450, 650, 475, 535);
  text ("MENU", 550, 520);
  
  println (mouseX, mouseY);
}

void pauseClick () {
  if (mouseX>725 && mouseX<775 && mouseX>725 && mouseX<775) {
    mode=game; //play button
    click ();
  }
  
  //if you click restart
  if (mouseX>150 && mouseX<350 && mouseY>475 && mouseY<535) {
    restart ();
    mode=game;
    paddleX=width/2;
    click ();
  }
  
  //if you click on menu
  if (mouseX>450 && mouseX<650 && mouseY>475 && mouseY<535) {
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
