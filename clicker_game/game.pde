void game () {
  image (gamebackground, 400, 400, width, height);
  noStroke ();
  fill (0, 175);
  rect (0, 0, width, height);
  pausebutton (720, 720);
  fill (yellow);
  noStroke ();
  if (whatimage==1) {
    image (pomni, x, y, d*1.2, d);
  } else if (whatimage==2) {
    image (jax, x, y, d*1.2, d);
  } else if (whatimage==3) {
    image (kinger, x, y, d*1.2, d);
  }
    
  //movements
  x=x+vx;
  y=y+vy;
  if (x<0+d/2 || x>width-d/2) {
    vx=-vx;
  }
  if (y<0+d/2 || y>height-d/2) {
    vy=-vy;
  }
  
  textSize (50);
  text ("Score:" + score, 700, 50);
  text ("Lives:" + lives, 100, 50);
  
  if (lives<=0) mode=gameover;//if you have one line of code, no need for the braces
}

void pausebutton (int x, int y) {
  pushMatrix ();
    translate (x, y);
    fill (0);
    if (dist (mouseX, mouseY, 720, 720) <25) {//if you click on the pause button
      stroke (red);
    } else {
      stroke (yellow);
    }
    strokeWeight (5);
    circle (0, 0, 50);
    line (-7, -10, -7, 10);
    line (7, -10, 7, 10);
  popMatrix ();
}

void gameClick () {
  if (dist (mouseX, mouseY, x, y)<d/2) {//if distance form mouseX and mouseY from x and y is less than radius
    vx=vx*1.2;
    vy=vy*1.2;
    score=score+1;
    point.rewind ();
    point.play ();
  } else if (dist (mouseX, mouseY, 720, 720) <25) {//if its on the pause button, games pauses
    fill (0, 150);//makes the background darker-> put this here, because if i put in in the pause tab, the game background won't show
    rect (0, 0, width, height);
    mode=pause;
  } else {
    lives=lives-1;
    loselife.rewind ();
    loselife.play ();
  }
}

//add timer?
