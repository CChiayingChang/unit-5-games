void game2 () {
  //setup---------------------------------------------------------------------
  
  level2=true;//on the map level 2 turns red and clickable
  
  progress=2;//tracks what mode to return to for pause screen
 
  background (black);
  
  fill (white);
  textSize (50);
  text ("LEVEL 2", 450, 50);
  
  //door---------------------------------------------------------------
  
  if (ballX>740 && ballY<340) {
    moveDoor=true;
  } 
  if (moveDoor==true) {
    doorX=doorX-10;
    doorY=doorY+10;
  }
  if (doorX<200) doorX=200;
  if (doorY>groundHeight-35) doorY=groundHeight-35;
  door (doorX, doorY);
  fill (255);
  
  //if you win-----------------------------------------------------------------------
  
  if (dist(doorX, doorY, ballX, ballY)<ballD && doorX==200) {
    reset3 ();
    door ();
  }
  
  //-----------------------------------------------------------------------------
  groundHeight=650;
  
  rectMode (CORNER);
  rect (0, 650, width, 50);//ground
  
  //platforms
  rect (0, 550, 90, 50);
  if (ballX>0 && ballX<100) platformHeight=550;
  
  rect (200, 480, 100, 50);
  if (ballX>200 && ballX<300) platformHeight=480;
  
  rect (400, obstacleHeight, 100, 50);//this is the obstacle that will crush you
  if (ballX>400 && ballX<500) platformHeight=430;
  
  rect (600, 370, 100, 50);
  if (ballX>600 && ballX<700) platformHeight=370;
  
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
  
  if ((ballX>=0 && ballX<=112) || (ballX>=188 && ballX<=312) || (ballX>=388 && ballX<=512) || (ballX>=588 && ballX<=712)) {//if ur in x range of the platforms
  //must have <= in either on platform or in between, otherwise ball can get stuck in the middle of the platform
    if (ballY>platformHeight+50+ballD/2) {//if you're under the platform
      if (up==true) {
        jumpTimer=jumpTimer+1;
      }
      if (jumpTimer>0 && jumpTimer<=10) ballY=ballY-15;
      else if (jumpTimer>10 && jumpTimer<20) {
        ballY=ballY+15;
      } else if (jumpTimer==20) {
         ballY=groundHeight-ballD/2;
         jumpTimer=0;
         up=false;
      } else {//if you hit the platform you start to move down
        ballY=ballY+15;
        if (ballY>groundHeight-ballD/2) ballY=groundHeight-ballD/2;
        jumpTimer=0;
        up=false;
      }
    } else  if (ballY<platformHeight){//if you're on top of the platform
      if (up==true) {
        jumpTimer=jumpTimer+1;
      }
      if (jumpTimer>0 && jumpTimer<=10) ballY=ballY-15;
      else if (jumpTimer>10 && jumpTimer<20 && ballY+ballD/2<platformHeight) ballY=ballY+15;
      else if (jumpTimer>10 && jumpTimer<20 && ballY+ballD/2>=platformHeight) ballY=platformHeight-ballD/2;
      if (jumpTimer==20) {
        ballY=platformHeight-ballD/2;
        jumpTimer=0;
        up=false;
      }
    } else {
        up=false;
        jumpTimer=0;
          ballY=ballY+15;
          if (ballY>groundHeight-ballD/2) ballY=groundHeight-ballD/2;
    }
 }
  
  if ((ballX>112 && ballX<188) || (ballX>312 && ballX<388) || (ballX>512 && ballX<588) || ballX>712) {//if you're between the platforms (x)
   jump ();
   if (jumpTimer==20) {
      ballY=groundHeight-25;
      jumpTimer=0;
      up=false;
    }
  }

  //if you walk off a platform you fall
  if ((ballX>112 && ballX<188) || (ballX>312 && ballX<388) || (ballX>512 && ballX<588) || ballX>712) {
    if (up==false) {
      ballY=ballY+15;
    }
    if (ballY>groundHeight-25) ballY=groundHeight-25;
  }
  
  println (ballX);
  
  //can't go through the platforms from the side-------------------------------------------------------
  
  if (ballX<125 && ballX>105 && ballY>525 && ballY<625) ballX=100+ballD/2;
 
  
  
  

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
    reset2 ();
    deaths=deaths+1;
  }
  
  //gap-------------------------------------------------------------------------------------
 //if you reach the gap
    if (ballX<250+ballD/2 && doorX==200) {//if the ball is past a certain point and the door already moved it will show the gap
      gap=true;
      if (up==false && ballX>240 && ballX<300) ballY=ballY+10;//if the ball is not jumping and it's within the x boundary of gap, starts to fall
      if (ballY>groundHeight-20) {
        ballX=250+ballD/2;//if it starts falling you can't move past the boundaries of gap-->so you don't get stuck midway down if you move
        respawn=true;
        stopJump=true;
      }
    }
    if (gap==true) {//once you pass that point, it will keep showing the gap
        rectMode (CORNER);
        fill (black);
        rect (250, groundHeight, 60, 50);
    }
 
 //the obstacle that will crush you------------------------------------------------------------------------

  if (doorX==200 && ballX<500) {
    crush=true;
  }
  if (crush==true) crushTimer=crushTimer+1;
  if (crushTimer>3) obstacleHeight=obstacleHeight+20;
  if (crush==true && ballX<512 && ballX>388 && ballY>360 && ballY>obstacleHeight && obstacleHeight>groundHeight-ballD-50 && obstacleHeight<groundHeight-50) respawn =true;//you die if it crushes you
  if (obstacleHeight>groundHeight-50) obstacleHeight=groundHeight-50;//the platform wil not sink below ground level
  if (obstacleHeight==groundHeight-50 && ballY>obstacleHeight-ballD/2 && ballX<=525 && ballX>=500) ballX=525;//can't go through pplatform from right side
  if (obstacleHeight==groundHeight-50 && ballY>obstacleHeight-ballD/2 && ballX>=375 && ballX<=400) ballX=375;//can't go trhough platform from left
  if (ballX+25>400 && ballX-25<500 && ballY>561 && obstacleHeight==groundHeight-50) ballY=561;//you can jump on top of the platform
  println (ballY);

  println (mouseX, mouseY);
//------------------------------
 
}



void game2Click () {
    if (mouseX>845 && mouseX<875 && mouseY>25 && mouseY<45) {//if you click on menu
    mode=pause;
    fill (black, 150);
    rect (0, 0, width, height);
    click ();
  }
}

void jump () {
  if (up==true) {
    jumpTimer=jumpTimer+1;
  }
  if (jumpTimer>0 && jumpTimer<=10) ballY=ballY-15;
  else if (jumpTimer>10 && jumpTimer<20) ballY=ballY+15;
}

//make it so that you can't move through the platforms
//fix it so that if you're jumping on top of the platform your jump height is not restricted by the previous platform height
//make it so its easier to jump over the gap
