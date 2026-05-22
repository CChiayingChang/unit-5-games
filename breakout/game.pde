void game () {
  background (0);
  
  //paddle
  circle (paddleX, paddleY, paddleD);
  //limits the movements of the paddle-->won't go beyond the screen
  if (paddleX<0+paddleD/2) paddleX=0+paddleD/2;
  if (paddleX>width-paddleD/2) paddleX=width-paddleD/2;
  //movements
  if (rightKey==true) paddleX=paddleX+10;
  if (leftKey==true) paddleX=paddleX-10;
  
  //bricks
  for (int i=0; i<=brickNumber-1; i+=1) {//start at 0 bc array starts at 0, keep adding 1 until i=2 (like the array), the number corresponds to x[0]=100 and stuff in the setup
    circle (x[i], y[i], 25);
    if (dist(ballX, ballY, x[i], y[i])<ballD/2+12) {
      vx=(ballX-x[i])
    }
  }
  
  //ball
  circle (ballX, ballY, ballD);
  ballX=ballX+vx;
  ballY=ballY+vy;
  //if it hits the walls
  if (ballX<0+ballD/2 || ballX>width-ballD/2) vx=-vx;
  if (ballY<0+ballD/2) vy=-vy;
  //if it hits the paddle
  if (dist(paddleX, paddleY, ballX, ballY)<=paddleD/2+ballD/2) {
    vy=(ballX-paddleX)/8;
    vx=(ballY-paddleY)/8;
  }
  //if it falls off screen
  if (ballY>height-ballD/2) {
    ballY=400;
  }
}

void gameClick () {

}
