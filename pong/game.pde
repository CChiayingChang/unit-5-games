void game () {
  background (0);
  if (speed==1) {
    howFast=0;
  } else if (speed==2) {
    howFast=5;
  } else if (speed==3) {
    howFast=10;
  }
  //paddles
  fill (255);
  noStroke ();
  imageMode (CENTER);
  image (ball, leftX, leftY, leftD, leftD);//left paddle
  rightD=leftD;
  image (ball, rightX, rightY, rightD, rightD);//update-->for now, rightD is equal to leftD
  
  //move paddles
  //if (leftY>0+leftD/2 && leftY<height-leftD/2) {//don't use this, it will get stuck
  if (wKey==true) leftY=leftY-10; //when you press on w, boolean becomes true and paddle moves up
  if (sKey==true) leftY=leftY+10;//when you press on s, boolean becomes true and paddle moves up
  if (onePlayer==false) {//two player mode-->can control right paddle with keyboard
    if (upKey==true) rightY=rightY-10;
    if (downKey==true) rightY=rightY+10;
  } else {//one player mode
    if (ballX>width/2) {//if the ball is on the right side
      if (ballY<rightY-rightD/2) {//if ball is above the paddle, the paddle moves up-->+- the diameter to make paddle slower and also to minimize paddle vibration
        rightY=rightY-10;
      } else if (ballY>rightY+rightD/2) {//if ball is below the paddle, paddle moves down
        rightY=rightY+5;
      }
    }
  }

  //paddle movement limits-->if it goes beyond the limit, it snaps back to the limit
  if (leftY<0+leftD/2) leftY=0+leftD/2;
  if (leftY>height-leftD/2) leftY=height-leftD/2;
  if (rightY<0+rightD/2) rightY=0+rightD/2;
  if (rightY>height-rightD/2) rightY=height-rightD/2;
  
  //divider
  stroke (255);
  strokeWeight (5);
  fill (blue);
  line (500, 0, 500, 700);
  
  //ball
  image (ball, ballX, ballY, ballD, ballD);
  
  //movements (ball)
  if (timer<0) {//the ball will only move once the countdown stops
    ballX=ballX+vx;//ball moves
    ballY=ballY+vy;//if you add howFast here, for some reason, the ball will not bounce off the walls
  }
  
  //hits left paddle
  if (dist (leftX, leftY, ballX, ballY)<=ballD/2+leftD/2) {
    //if the distance between the center of the ball and the center of the paddle is equal to or less than the combined radiuses, then changes direction
    vx=(ballX-leftX)/15+howFast;//moves if off at an angle
    pingpong.rewind ();
    pingpong.play ();
    vy=(ballY-leftY)/15+howFast;//have to divide the speed otherwise its too fast cause the speed will be equal to the coordinates
  }
  //hits right paddle
  if (dist (rightX, rightY, ballX, ballY)<=ballD/2+rightD/2) {
    //moves it off at an angle
    pingpong.rewind ();
    pingpong.play ();
    vx=-(rightX-ballX)/15-howFast;//make the speed negative, otherwise the ball moves right and gets stuck in the paddle
    vy=-(rightY-ballY)/15-howFast;
  }
  
  //if ball hits top or bottom wall
  if (ballY<=0+ballD/2 || ballY>=height-ballD/2) {
    vy=vy*-1;
    pingpong.rewind ();
    pingpong.play ();
  }    
  
  //scores
  if (ballX<0) {//if right scores
    point.rewind ();
    point.play ();
    rightscore++;//++means plus 1
    ballX=width/2;//brings ball back to center of screen--> also, if you don't add, the score will increase infinitely
    ballY=height/2;
    timer=100;
    randomDirection ();
  }
  if (ballX>width){//if left scores
    point.rewind ();
    point.play ();
    leftscore++;
    ballX=width/2;
    ballY=height/2;
    timer=100;
    randomDirection ();
  }
  textSize (50);
  text (leftscore, 250, 75);//left score
  text (rightscore, 750, 75); //right score
  if (timer>=0) text(timer, 750, 650);//timer for the ball countdown
  timer=timer-1;
  
  println (mouseX, mouseY);
  
  if (leftscore==3 || rightscore==3) {
    mode=gameover;
  }
  
  //pause button
  imageMode (CORNER);
  tactilebutton (900, 950, 600, 650, 900, 600, 50, 50);
  fill (0);
  if (mouseX>900 && mouseX<950 && mouseY>600 && mouseY<650) {
    stroke (magenta);
  } else stroke (blue);
  line (917, 614, 917, 636);
  line (933, 614, 933, 636);
}

void gameClick () {
  if (mouseX>900 && mouseX<950 && mouseY>600 && mouseY<650) {//if you click on the pause button
    mode=pause;
    noStroke ();
    fill (0, 150);//this darkens the background for the pause screen-->put here, makes whole background dark if i put it in pause tab
    rect (0, 0, width, height);
    click ();
  }
}

//ball might get stuck between walland paddle--fix
//fix ball movemen-->sometimes gets stuck bouncing up and down
//one player mode--> the right paddle vibrates
//fix ball inital speed
//fix start angle-->sometimes gets stuck bouncing up and down, boring
