void game2 () {
  //setup---------------------------------------------------------------------
 
  println (mouseX, mouseY);
  background (black);
  
  fill (white);
  textSize (50);
  text ("LEVEL 2", 450, 50);
  
  door (800, 60);
  fill (255);
  
  obstacle (400, obstacleHeight, 50, 50);
  
  rectMode (CORNER);
  groundHeight=650;
  ballY=groundHeight-25;
  rect (0, groundHeight, width, 50);//ground
  ballX=100;
  
  menu ();
  
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
  
  
  if (gap==true) {//once you pass that point, it will keep showing the gap
      rectMode (CORNER);
      fill (black);
      rect (610, groundHeight, 60, 50);
    }
  
 
 respawn ();
 
}


  
//------------------------------------------------------------------------



void game2Click () {
  
}
