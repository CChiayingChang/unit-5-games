void game () {
 //setup--------------------------------------------------------------------- 
 
  println (mouseX, mouseY);
  background (black);
  
  fill (white);
  textSize (50);
  text ("LEVEL 1", 450, 50);
  
  door (800, groundHeight-35);
  fill (255);
  
  textSize (30);
  text ("LIVES:" + lives, 800, 40);
  
  obstacle (400, obstacleHeight, 50, 50);
  
  rectMode (CORNER);
  rect (0, groundHeight, width, 50);//ground
  
  //spikes
  for (int x=0; x<=900; x+=25) {
    triangle (x, 700, x+25, 700, x+12.5, 650);
  }
  
  //respawning------------------------------------------------------------------
  
  //pauses before it respawns the character
  if (respawn==false) {//if you didn't die, show the character
    circle (ballX, ballY, ballD);
  } else if (respawn==true) {//the character disappears while the timer runs
    timer=timer+1;
    fill (red);
    textSize (150);
    text ("PSYCHE!", 450, 350);
  }
  if (timer>50) {//once the timer is up, show the character
    respawn=false;
    timer=0;
    ballX=100;
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
  //gameplay----------------------------------------------------------------
  
  //if you get close to the obstacle it starts rising
  if (dist(ballX, ballY, 400, obstacleHeight)<ballD/2+100) {
    obstacleHeight=obstacleHeight-2;
    if (obstacleHeight<(groundHeight-25)) {
      obstacleHeight=groundHeight-25;//once the obstacle gets to a certain height it stops there
    }
  }
  
  //if you fall on the spikes you die
  if (ballY>650) {
    lives=lives-1;
    ballX=100;
    ballY=525;
    obstacleHeight=groundHeight+25;
    respawn=true;
  }
  
  //if you reach the gap
  if (ballX>610) {//if the ball is past a certain point it will show the gap
    rectMode (CORNER);
    fill (black);
    rect (610, groundHeight, 60, 50);
    if (up==false && ballX>610 && ballX<670)//if the ball is not jumping and it's within the x boundary of gap
    ballY=ballY+10;//starts to fall
    if (ballY>groundHeight) ballX=610+ballD/2;//if it starts falling you can't move past the boundaries of gap-->so you don't get stuck midway down if you move
  }
  
  //if you reach the door
  if (dist(800+45/2, groundHeight-35, ballX, ballY)<ballD/2) {
    mode=game2;
  }
  
  //---------------------------------------------------------------------------
  
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
