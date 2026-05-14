void game () {
  theme.play ();
  
  //background
  image (gamebackground, 400, 400, width, height);
  noStroke ();
  fill (0, 175);
  rect (0, 0, width, height);//this makes the background darker
  
  pausebutton (720, 720);//game will pause when you press on it
  fill (yellow);
  noStroke ();
  if (whatimage==1) {//target--> based on what option you chose in the option screen, the target will appear as that image
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
  text ("Score:" + score, 700, 50);//the +score will display the current score
  text ("Lives:", 100, 50);
  if (lives==3) {//will display the lives as hearts
    image (heart, 190, 58, 45, 45);
    image (heart, 240, 58, 45, 45);
    image (heart, 290, 58, 45, 45);
  } else if (lives==2) {
    image (heart, 190, 58, 45, 45);
    image (heart, 240, 58, 45, 45);
  } else if (lives==1) {
    image (heart, 190, 58, 45, 45);
  }
  
  if (lives<=0) mode=gameover;//if you have one line of code, no need for the braces
  
  println (mouseX, mouseY);
}

void pausebutton (int x, int y) {
  pushMatrix ();
    translate (x, y);
    fill (0);
    if (dist (mouseX, mouseY, 720, 720) <25) {//if you hover over the pause button, will change colours (tactile)
      stroke (red);
    } else {
      stroke (yellow);
    }
    strokeWeight (5);
    circle (0, 0, 50);
    line (-7, -10, -7, 10);//the lines for the pause button
    line (7, -10, 7, 10);
  popMatrix ();
}

void gameClick () {
  if (dist (mouseX, mouseY, x, y)<d/2) {//if distance form mouseX and mouseY from x and y of target is less than radius (click on target)
    vx=vx*1.3;//speed increases
    vy=vy*1.3;//spead increases
    score=score+1;
    point.rewind ();//willl reset the point sound effect so you can play it properly
    point.play ();//point sound effect
  } else if (dist (mouseX, mouseY, 720, 720) <25) {//if its on the pause button, games pauses
    fill (0, 150);//makes the background darker-> put this here, because if i put in in the pause tab, the game background won't show, and it'll all be black
    rect (0, 0, width, height);
    click ();
    mode=pause;
  } else {//if miss the target
    lives=lives-1;
    loselife.rewind ();//resets the loselife sound so you can play it properly
    loselife.play ();//sound effect
  }
}

//add timer?
