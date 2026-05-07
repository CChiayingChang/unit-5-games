void game () {
  background (0);
  pausebutton (720, 720);
  fill (255, 0, 0);
  noStroke ();
  circle (x, y, d);
  println (mouseX, mouseY);
  
  //movements
  x=x+vx;
  y=y+vy;
  
  textSize (50);
  text ("Score:" + score, 700, 50);
  text ("Lives:" + lives, 100, 50);
  
  //bounce
  if (x<0+d/2 || x>width-d/2) {
    vx=-vx;
  }
  if (y<0+d/2 || y>height-d/2) {
    vy=-vy;
  }
  
  if (lives==0) mode=gameover;//if you have one line of code, no need for the braces
}

void pausebutton (int x, int y) {
  pushMatrix ();
    translate (x, y);
    fill (0);
    stroke (yellow);
    strokeWeight (5);
    circle (0, 0, 50);
    line (-7, -10, -7, 10);
    line (7, -10, 7, 10);
  popMatrix ();
}

void gameClick () {
  if (dist (mouseX, mouseY, x, y)<d/2) {//if distance form mouseX and mouseY from x and y is less than radius
    vx=vx*1.5;
    vy=vy*1.5;
    score=score+1;
    point.rewind ();
    point.play ();
  } else if (dist (mouseX, mouseY, 720, 720) <25) {
    mode=pause;
  } else {
    lives=lives-1;
    loselife.rewind ();
    loselife.play ();
  }
}

//add a restart button
//add timer?
