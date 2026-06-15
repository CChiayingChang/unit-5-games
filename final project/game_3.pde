void game3 () {
  background (0);
  level3=true;//for the clickable circles on the map
  progress=3;//tracks what mode to return to for pause screen
  
  fill (white);
  textSize (50);
  text ("LEVEL 3", 450, 50);
  
  menu ();
  
  groundHeight=500;
  rectMode (CORNER);
  rect (0, groundHeight, 400, 200);//first section of ground
  rect (500, groundHeight, 400, 200);//2nd section of ground
  
  doorX=800;
  doorY=500-35;
  door (doorX, doorY);
  
  println (mouseX, mouseY);
  
  obstacle3 ();
  
  //respawn-----------------------------------------------------------------------------------------------
 //pauses before it respawns the character
  if (respawn==false) {//if you didn't die, show the character
    fill (white);
    circle (ballX, ballY, ballD);
  } else if (respawn==true) {//the character disappears while the timer runs
    timer=timer+1;
    fill (red);
    textSize (150);
    text ("SIKE!", 450, 350);
    
  }
  if (timer>50) {//once the timer is up, show the character
    respawn=false;
    timer=0;
    ballX=100;
    ballY=475;
    gap=false;//hide the gap again
    moveDoor=false;
    obstacle3X=615;
    moveobstacle3=false;
  }
  
  movement ();
  
  //gap-----------------------------------------------------------------------------------------
  if (ballX>438 && ballX<488 && up==false) {//if it falls into the gap
    up=false;
    gap=true;//why only work if gap=true?????
    ballY=ballY+15;
    ballX=450;
  }
  if (ballY>height) respawn=true;
  
  //if you get close to the obstacle-------------------------------------------------------------
  if (ballX>obstacle3X-ballD/2) {//if you're touching the obstacle
    ballX=obstacle3X-ballD/2;//the ball can't go past the obstacle
    moveobstacle3=true;
  }
  if (moveobstacle3==true) {
    obstacle3X=obstacle3X-10;//if you touch the obstacle the obstacle moves back and pushes you into the gap
    if (obstacle3X<500) obstacle3X=500;// obstacle stops at the gap
  }
  
}

void game3Click () {
  if (mouseX>845 && mouseX<875 && mouseY>25 && mouseY<45) {//if you click on menu
    mode=pause;
    fill (black, 150);
    rect (0, 0, width, height);
  }
}

void obstacle3 () {
  fill (white);
  rectMode (CORNER);
  rect (obstacle3X, obstacle3Y, 75, 150);
}
