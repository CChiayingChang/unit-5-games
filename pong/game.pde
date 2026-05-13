void game () {
  background (0);
  //paddles
  circle (leftX, leftY, leftD);
  circle (rightX, rightY, rightD);
  //move paddles
  if (leftY>=0 && leftY<=height) {//why gets stuck?
    if (wKey==true) leftY=leftY-10; //when you press on w, boolean becomes true and paddle moves up
    if (sKey==true) leftY=leftY+10;//when you press on s, boolean becomes true and paddle moves up
  }
  if (upKey==true) rightY=rightY-10;
  if (downKey==true) rightY=rightY+10;
  
  //ball
  circle (ballX, ballY, ballD);
}

void gameClick () {
  
}
