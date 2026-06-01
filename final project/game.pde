void game () {
  background (black);
  
  textSize (30);
  text ("LIVES:" + lives, 450, 100);
  
  rectMode (CORNER);
  rect (0, groundHeight, width, 50);//ground
  
  
  //pauses before it respawns the character
  if (respawn==false) {//if you didn't die, show the character
    circle (ballX, ballY, ballD);
  } else if (respawn==true) {//the character disappears while the timer runs
    timer=timer+1;
  }
  if (timer>50) {//once the timer is up, show the character
    respawn=false;
    timer=0;
  }
  
  //movements-----------------------------------------------------
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
  if (jumpTimer>0 && jumpTimer<=10) {
    ballY=ballY-15;
  } else if (jumpTimer>10 && jumpTimer<20) {
    ballY=ballY+15;
  } else if (jumpTimer==20) {
    ballY=groundHeight-ballD/2;
    jumpTimer=0;
    up=false;
  }
  //----------------------------------------------------------------
  
  obstacle (400, obstacleHeight, 50, 50);
  if (dist(ballX, ballY, 400, obstacleHeight)<ballD/2+100) {
    obstacleHeight=obstacleHeight-2;
    if (obstacleHeight<(groundHeight-25)) obstacleHeight=groundHeight-25;//once the obstacle gets to a certain height it stops there
  }
}

void obstacle (int x, int y, int w, int h) {
  rectMode (CENTER);
  rect (x, y, w, h);
  if (dist(ballX, ballY, x, y)<ballD/2+w/2) {//if you hit the obstacle
    lives=lives-1;
    ballX=100;
      respawn=true;
      obstacleHeight=groundHeight+25;
  }
}

void gameClick () {

}
