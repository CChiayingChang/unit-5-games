void game () {
  background (0);
  //paddles
  circle (leftX, leftY, leftD);
  circle (rightX, rightY, rightD);
  //move paddles
  //if (leftY>0+leftD/2 && leftY<height-leftD/2) {//don't use this, it will get stuck
  if (wKey==true) leftY=leftY-10; //when you press on w, boolean becomes true and paddle moves up
  if (sKey==true) leftY=leftY+10;//when you press on s, boolean becomes true and paddle moves up
  if (upKey==true) rightY=rightY-10;
  if (downKey==true) rightY=rightY+10;
  //paddle movement limits-->if it goes beyond the limit, it snaps back to the limit
  if (leftY<0+leftD/2) leftY=0+leftD/2;
  if (leftY>height-leftD/2) leftY=height-leftD/2;
  if (rightY<0+rightD/2) rightY=0+rightD/2;
  if (rightY>height-rightD/2) rightY=height-rightD/2;
  
  stroke (255);
  strokeWeight (5);
  line (500, 0, 500, 700);
  
  //ball
  circle (ballX, ballY, ballD);
  
  //movements
  if (timer<0) {//the ball will only move once the countdown stops
    ballX=ballX+vx;//ball moves
    ballY=ballY+vy;
  }
  
  if (dist (leftX, leftY, ballX, ballY)<=ballD/2+leftD/2) {
    //if the distance between the center of the ball and the center of the paddle is equal to or less than the combined radiuses, then changes direction
    vx=(ballX-leftX)/15;//moves if off at an angle
    vy=(ballY-leftY)/15;//have to divide the speed otherwise its too fast cause the speed will be equal to the coordinates
  }
  if (dist (rightX, rightY, ballX, ballY)<=ballD/2+rightD/2) {
    //moves it off at an angle
    vx=-(rightX-ballX)/15;//make the speed negative, otherwise the ball moves right and gets stuck in the paddle
    vy=-(rightY-ballY)/15;
  }
  
  if (ballY<=0+ballD/2 || ballY>=height-ballD/2) vy=vy*-1; //if the ball hits the top or bottom wall, it will bounce off
  //scores
  if (ballX<0) {
    rightscore++;//++means plus 1
    ballX=width/2;//brings ball back to center of screen--> also, if you don't add, the score will increase infinitely
    ballY=height/2;
    timer=100;
  }
  if (ballX>width){
    leftscore++;
    ballX=width/2;
    ballY=height/2;
    timer=100;
  }
  textSize (50);
  text (leftscore, 250, 75);//left score
  text (rightscore, 750, 75); //right score
  if (timer>=0) text(timer, 750, 650);
  timer=timer-1;
  
  println (mouseX, mouseY);
  
  if (leftscore==3 || rightscore==3) {
    mode=gameover;
  }
}

void gameClick () {
  
}

//ball might get stuck between walland paddle--fix
//fix ball movemen-->sometimes gets stuck bouncing up and down
