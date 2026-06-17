void game () {
 //setup--------------------------------------------------------------------- 
 
 progress=1;//variable to keep track of what level you're on so when you resume from pause it knows what level to resume to
 
 groundHeight=550;
 
  background (black);
  
  fill (white);
  textSize (50);
  text ("LEVEL 1", 450, 50);
  
  doorX=800;
  doorY=groundHeight-35;
  door (doorX, doorY);
  fill (255);
  
  obstacle (400, obstacleHeight, 50, 50);
  
  rectMode (CORNER);
  rect (0, groundHeight, width, 50);//ground
  
  //spikes
  for (int x=0; x<=900; x+=25) {
    triangle (x, 700, x+25, 700, x+12.5, 650);
  }
  
  menu ();
  
  //movements-----------------------------------------------------
  
  movement ();

  //gameplay----------------------------------------------------------------
  
  if (mode==game) {
  
    //if you get close to the obstacle it starts rising
    if (dist(ballX, ballY, 400, obstacleHeight)<ballD/2+50 || ballX>350) {
      obstacleHeight=obstacleHeight-10;
      if (obstacleHeight<(groundHeight-25)) {
        obstacleHeight=groundHeight-25;//once the obstacle gets to a certain height it stops there
      }
    }
    
    //if you fall on the spikes you die
    if (ballY>650) {
      ballX=100;
      ballY=525;
      obstacleHeight=groundHeight+25;
      respawn=true;
    }
    
    //if you reach the gap
    if (ballX>610-ballD/2) {//if the ball is past a certain point it will show the gap
      gap=true;
      if (up==false && ballX>610 && ballX<670) ballY=ballY+10;//if the ball is not jumping and it's within the x boundary of gap, strats to fall
      if (ballY>groundHeight-20) {
        ballX=610+ballD/2;//if it starts falling you can't move past the boundaries of gap-->so you don't get stuck midway down if you move
        stopJump=true;
      }
    }
    if (gap==true) {//once you pass that point, it will keep showing the gap
        rectMode (CORNER);
        fill (black);
        rect (610, groundHeight, 60, 50);
      }
    
    //if you reach the door
    if (dist(doorX, doorY, ballX, ballY)<ballD) {//if distance from center of door to center of ball less than diameter of ball
      reset2 ();
      door ();
    }
  }
 
 respawn ();
 
}


  
//------------------------------------------------------------------------

void obstacle (int x, int y, int w, int h) {
  rectMode (CENTER);
  rect (x, y, w, h);
  if (dist(ballX, ballY, x, y)<ballD/2+w/2) {//if you hit the obstacle
    ballX=100;
      respawn=true;
      obstacleHeight=groundHeight+25;
  }
}

void gameClick () {
  if (mouseX>845 && mouseX<875 && mouseY>25 && mouseY<45) {//if you click on menu
    mode=pause;
    fill (black, 150);
    rect (0, 0, width, height);
    click ();
  }
}

void movement () {
  //keeps ball within screen
  if (ballX<ballD/2) {
    ballX=ballD/2;
  }
  if (ballX>width-ballD/2) {
    ballX=width-ballD/2;
  }
  
  //right and left movement
  if (right==true) ballX=ballX+10;
  if (left==true) ballX=ballX-10;
  
  //jumping
    if (up==true) jumpTimer=jumpTimer+1;
    if (jumpTimer>0 && jumpTimer<=10 && stopJump==false) ballY=ballY-15;
    else if (jumpTimer>10 && jumpTimer<20) ballY=ballY+15;
    else if (jumpTimer==20) {
      ballY=groundHeight-ballD/2;
      jumpTimer=0;
      up=false;
   } else if (gap==false) ballY=groundHeight-25;
 
  
}

void respawn () {
  //pauses before it respawns the character
  if (respawn==false) {//if you didn't die, show the character
    fill (white);
    circle (ballX, ballY, ballD);
  } else if (respawn==true) {//the character disappears while the timer runs
    timer=timer+1;
    fill (red);
    textSize (150);
    text ("SIKE!", 450, 350);
    die ();
    obstacleHeight=groundHeight-25;
  }
  if (timer>50) {//once the timer is up, show the character
    reset1 ();
    deaths=deaths+1;
  }
}

//make it so that the obstacle height is reset
