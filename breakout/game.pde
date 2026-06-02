

void game () {
  background (0);
  noStroke ();
  
  //paddle
  fill (255);
  circle (paddleX, paddleY, paddleD);
  //limits the movements of the paddle-->won't go beyond the screen
  if (paddleX<0+paddleD/2) paddleX=0+paddleD/2;
  if (paddleX>width-paddleD/2) paddleX=width-paddleD/2;
  //movements
  if (rightKey==true) paddleX=paddleX+10;
  if (leftKey==true) paddleX=paddleX-10;
  
  //bricks
  for (int i=0; i<=brickNumber-1; i+=1) {//start at 0 bc array starts at 0, keep adding 1 until i=2 (like the array), the number corresponds to x[0]=100 and stuff in the setup
    if (hit [i]==false) brickStuff (i);//if it hasn't been hit hit yet, then do the code for the brick
  }
  
  //ball
  fill (255);
  circle (ballX, ballY, ballD);
  ballX=ballX+vx;
  ballY=ballY+vy;
  
  //if it hits the walls
  if (ballX<ballD/2 || ballX>width-ballD/2) {
    vx=-vx;
    collide ();//colldie audio
  }
  if (ballY<ballD/2) {
    vy=-vy;
    collide ();
  }
  
  
  //if it hits the paddle
  if (dist(paddleX, paddleY, ballX, ballY)<paddleD/2+ballD/2) {
    vy=(ballY-paddleY)/4;
    vx=(ballX-paddleX)/4;
    collide ();
  }
    
    
  //if it falls off screen
  if (ballY>height-ballD/2) {
    //resets the ball position and direction
    ballY=400;
    vy=10;
    vx=0;
    lives=lives-1;
    ballX=400;
    loselife.rewind ();
    loselife.play ();
  }
  
  if (points==90) mode=gameover;
  if (lives==0) mode=gameover;
  
  textSize (20);
  fill (red);
  text ("POINTS:" + points, 725, 40);
  text ("LIVES:" + lives, 75, 40);
  println (mouseX, mouseY);
  
  //pausebutton
  tactileButton (725, 775, 725, 775);
  rect (725, 725, 50, 50);
  strokeWeight (5);
  tactileText (725, 775, 725, 775);
  line (740, 740, 740, 760);
  line (760, 740, 760, 760);
 
}

void gameClick () {
  if (mouseX>725 && mouseX<775 && mouseX>725 && mouseX<775) {//if you click on the pause button
    fill (0, 150);
    noStroke ();
    rect (0, 0, width, height);//darkens the screen
    mode=pause;
    click ();
  }
}

void brickStuff (int i) {
   if (y[i]==75) fill (red);
    if (y[i]==125) fill (orange);
    if (y[i]==175) fill (yellow);
    if (y[i]==225) fill (green);
    if (y[i]==275) fill (blue);
    if (y[i]==325) fill (purple);
    circle (x[i], y[i], 25);
    //if the ball hits the bricks
    if (dist(ballX, ballY, x[i], y[i])<ballD/2+12) {
      vy=(ballY-y[i])/3;
      vx=(ballX-x[i])/3;
      hit [i]=true;
      points=points+1;//gain a point if you hit a ball
      point.rewind ();
      point.play ();
    }
}

//make faster as your streak gets higher?
//twice as many points if you get streak above 10?

//vx, vy, boucning, collision, array on quiz, if statements

//figure out how to stop ball from bouncing back and forth horizontally
