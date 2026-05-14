void pause () {
  //don't do any background or anything here-->it will freeze the screen on the last image left behnd of the game
  theme.pause ();
  play (720, 720);//play button
  fill (yellow);
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
  if (dist (mouseX, mouseY, 720, 720)<25) {//if you press the play button
    mode=game;
    click ();
  } else if (mouseX>100 && mouseX<350 && mouseY>450 && mouseY<550){//back to start button
  //reset everything
    mode=intro;
    lives=3;
    score=0;
    //resets speed
    vx=random (5*cos(a));//generates random x angle
    vy=random (5*sin(a));//generates random y angle
    slider=570;
    d=100;
    click ();
  } else if (mouseX>450 && mouseX<700 && mouseY>450 && mouseY<550) {//restart button
    //restarts the game--> doesnt take you back to intro page, but lives and socre reset, as well as velocity
    mode=game;
    lives=3;
    score=0;
    vx=random (5*cos(a));//generates random x angle
    vy=random (5*sin(a));//generates random y angle
    click ();
  }
}

void play (int x, int y) {//play button
  pushMatrix ();
    translate (x, y);
    fill (0);
    if (dist (mouseX, mouseY, 720, 720)<25) {//tactile
      stroke (red);
    } else {
      stroke (yellow);
    }
    strokeWeight (5);
    fill (0);
    circle (0, 0, 50);
    noStroke ();
    if (dist (mouseX, mouseY, 720, 720)<25) {//tactile
      fill (red);
    } else {
      fill (yellow);
    }
    triangle (-7, -10, 13, 0, -7, 10);
  popMatrix ();
}

//control music volume? change music?
