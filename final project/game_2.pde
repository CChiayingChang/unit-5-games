void game2 () {
  //setup---------------------------------------------------------------------
  
  level2=true;//on the map level 2 turns red and clickable
  
  progress=2;//tracks what mode to return to for pause screen
 
  println (mouseX, mouseY);
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
  
  if (dist(200+45/2, groundHeight-35, ballX, ballY)<ballD && doorX==200) {
    mode=game3;
  }
  
  //-----------------------------------------------------------------------------
  groundHeight=650;
  
  rectMode (CORNER);
  rect (0, 650, width, 50);//ground
  
  rect (0, 550, 90, 50);//overhead hang
  if (ballX>0 && ballX<100) platformHeight=550;
  
  rect (200, 490, 100, 50);
  if (ballX>200 && ballX<300) platformHeight=490;
  
  rect (400, 430, 100, 50);
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
      if (up==true) jumpTimer=jumpTimer+1;
      if (jumpTimer>0 && jumpTimer<=10) ballY=ballY-15;
      else if (jumpTimer>10 && jumpTimer<20) {
        ballY=ballY+15;
        jumpTimer=0;
      } else if (jumpTimer==20) {
         ballY=groundHeight-ballD/2;
         jumpTimer=0;
      } else {
        ballY=ballY+15;
        if (ballY>groundHeight-ballD/2) ballY=groundHeight-ballD/2;
      }
      println ("under");
    } else  if (ballY<platformHeight){//if you're on top of the platform
      if (up==true) jumpTimer=jumpTimer+1;
      if (jumpTimer>0 && jumpTimer<=10) ballY=ballY-15;
      else if (jumpTimer>10 && jumpTimer<20 && ballY+ballD/2<platformHeight) ballY=ballY+15;
      else if (jumpTimer>10 && jumpTimer<20 && ballY+ballD/2>=platformHeight) ballY=platformHeight-ballD/2;
      if (jumpTimer==20) {
        ballY=platformHeight-ballD/2;
        jumpTimer=0;
        up=false;
      }
      println ("over");
    } else {
        up=false;
        jumpTimer=0;
          ballY=ballY+15;
          if (ballY>groundHeight-ballD/2) ballY=groundHeight-ballD/2;
        println ("between");
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
  
  ////prevents the ball from getting between the platform
  //if (ballY>platformHeight-ballD/2 && ballY<platformHeight+50+ballD/2 && ballX<100+ballD/2) {//if the ballY is in middle of platform
  //   ballX=100+ballD/2;
  //}

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
    
    obstacleHeight=groundHeight-25;
  }
  if (timer>50) {//once the timer is up, show the character
    respawn=false;
    timer=0;
    ballX=100;
    ballY=525;
    //resets the obstacle height
    doorX=800;
    doorY=310;
    gap=false;//hide the gap again
    moveDoor=false;
  }
  
  //gap-------------------------------------------------------------------------------------
 //if you reach the gap
    if (ballX<250+ballD/2 && doorX==200) {//if the ball is past a certain point and the door already moved it will show the gap
      gap=true;
      if (up==false && ballX>240 && ballX<300) ballY=ballY+10;//if the ball is not jumping and it's within the x boundary of gap, starts to fall
      if (ballY>groundHeight-20) {
        ballX=250+ballD/2;//if it starts falling you can't move past the boundaries of gap-->so you don't get stuck midway down if you move
        respawn=true;
      }
    }
    if (gap==true) {//once you pass that point, it will keep showing the gap
        rectMode (CORNER);
        fill (black);
        rect (250, groundHeight, 60, 50);
    }
 
 
}


  
//------------------------------------------------------------------------



void game2Click () {
    if (mouseX>845 && mouseX<875 && mouseY>25 && mouseY<45) {//if you click on menu
    mode=pause;
    fill (black, 150);
    rect (0, 0, width, height);
  }
}

void jump () {
  if (up==true) jumpTimer=jumpTimer+1;
  if (jumpTimer>0 && jumpTimer<=10) ballY=ballY-15;
  else if (jumpTimer>10 && jumpTimer<20) ballY=ballY+15;
}


//make it so that the door wil move when you get to that point and not stop moving as soon as you move out of range
