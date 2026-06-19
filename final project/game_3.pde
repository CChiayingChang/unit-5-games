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
  
  obstacle3 ();//the big obstacle that shows up first
  
  //the small obstacle that shows up second
  rect (obstacleX, obstacleY, 50, 50);
  
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
    die ();
  }
  if (timer>50) {//once the timer is up, show the character
    reset3 ();
    deaths=deaths+1;
    
  }
  
  movement ();
  
  //gap-----------------------------------------------------------------------------------------
  if (ballX>412 && ballX<488 && up==false) {//if it falls into the gap
    up=false;
    gap=true;//why only work if gap=true?????
    ballY=ballY+15;
    ballX=450;
    stopJump=true;
  }
  if (ballY>height) respawn=true;
  
  //can't go into the wall if you fall into the gap
  if (ballY>groundHeight-25 && ballX<425) ballX=425;
  if (ballY>groundHeight-25 && ballX>475) ballX=475;
  
  //if you get close to the obstacle-------------------------------------------------------------
  if (ballX>obstacle3X-ballD/2) {//if you're touching the obstacle
    ballX=obstacle3X-ballD/2;//the ball can't go past the obstacle
    moveobstacle3=true;
  }
  if (moveobstacle3==true && obstacle3Timer==0) {
    obstacle3X=obstacle3X-10;//if you touch the obstacle the obstacle moves back and pushes you into the gap
    obstacle3Y=obstacle3Y-10;
    if (obstacle3X<500) obstacle3X=500;// obstacle stops at the gap
    if (obstacle3Y<350 && obstacle3Timer==0) obstacle3Y=350;
  }
  
  if (obstacle3X<=500) obstacle3Timer=obstacle3Timer+1;
  if (obstacle3Timer>100 && obstacle3Y<1000) {//makes the big obstacle pause, then disappear
    obstacle3Y=obstacle3Y+10;
    obstacle3X=900;//so the ball won't get stuck when trying to jump past--otherwise can't make it past
  }
  if (obstacle3Timer>1000) {
    obstacle3Timer=0;//reset timer
  }
  
  if (obstacle3X==500 && ballX<390) {//if you make it past first obstacle, second one will push you in
    smallObstacle=true;
  }
  if (smallObstacle==true) {
    obstacleY=obstacleY-5;
    if (obstacleY<450) obstacleY=450;
    obstacleX=obstacleX+7;
    if (obstacleX>350) obstacleX=350;
  }
  if (obstacleX==350 && ballX<obstacleX-ballD/2) {
    smallObstacle=false;
    obstacleY=obstacleY+5;//the small obstacle disappears
  }
  
  //the ball gets pushed by the obstacle/can't go through the obstacle
  if (ballY>obstacleY && ballX<obstacleX+50+ballD/2 && ballX>obstacleX) ballX=obstacleX+50+ballD/2;
  if (ballY>obstacleY && ballX<obstacleX && ballX>obstacleX-25) ballX=obstacleX-25;
  if (obstacleX==350 && ballX==400+ballD/2 && ballY>obstacleY) ballX=450;//if you fall in the gap you can't move sideways
  
  //if you reach the door--------------------------------------------------------------------
  if (dist(ballX, ballY, doorX, doorY)<ballD) {
    mode=gameover;
    door ();
  }
  
}

void game3Click () {
  if (mouseX>845 && mouseX<875 && mouseY>25 && mouseY<45) {//if you click on menu
    mode=pause;
    fill (black, 150);
    rect (0, 0, width, height);
    click ();
  }
}

void obstacle3 () {
  fill (white);
  rectMode (CORNER);
  rect (obstacle3X, obstacle3Y, 75, 500);
}

//make it so that ur unable to go through the walls when in gap
//fix glitch when you try to jump ove the gap after first obstacle appears
//fix the pause that happens when you jump in a gap
