void game2 () {
  //setup---------------------------------------------------------------------
  
  level2=true;//on the map level 2 turns red and clickable
  
  progress=2;
 
  println (mouseX, mouseY);
  background (black);
  
  fill (white);
  textSize (50);
  text ("LEVEL 2", 450, 50);
  
  doorX=800;
  doorY=310;
  door ();
  fill (255);
  
  groundHeight=650;
  
  rectMode (CORNER);
  rect (0, 650, width, 50);//ground
  
  rect (0, 550, 100, 50);//overhead hang
  
  rect (200, 490, 100, 50);
  
  rect (400, 430, 100, 50);
  
  rect (600, 370, 100, 50);
  
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

 //respawn-----------------------------------------------------------------------------------------------
 //pauses before it respawns the character
  if (respawn==false) {//if you didn't die, show the character
    fill (white);
    circle (ballX, ballY, ballD);
  } else if (respawn==true) {//the character disappears while the timer runs
    timer=timer+1;
    fill (red);
    textSize (150);
    text ("PSYCHE!", 450, 350);
    
    obstacleHeight=groundHeight-25;
  }
  if (timer>50) {//once the timer is up, show the character
    respawn=false;
    timer=0;
    ballX=100;
    ballY=groundHeight-25;
    //resets the obstacle height
    obstacleHeight=groundHeight+25;
    gap=false;//hide the gap again
  }
  
  //-------------------------------------------------------------------------------------
 
}


  
//------------------------------------------------------------------------



void game2Click () {
    if (mouseX>845 && mouseX<875 && mouseY>25 && mouseY<45) {//if you click on menu
    mode=pause;
    fill (black, 150);
    rect (0, 0, width, height);
  }
}
