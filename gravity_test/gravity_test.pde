int ballX;
int ballY;
int ballD;

boolean up;
boolean right;
boolean left;

int groundHeight;

int jumpTimer;
int jump;

int lives;

void setup () {
  size (600, 600);
  ballX=100;
  ballY=525;
  ballD=50;
  
  up=false;
  right=false;
  left=false;
  
  groundHeight=550;
  jumpTimer=0;
  lives=3;
}

void draw () {
  background (0);
  
  textSize (30);
  text ("LIVES:" + lives, 450, 100);
  
  rect (0, groundHeight, width, 50);//ground
  circle (ballX, ballY, ballD);
  
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
    ballY=ballY-10;
  } else if (jumpTimer>10 && jumpTimer<20) {
    ballY=ballY+10;
  } else if (jumpTimer==20) {
    ballY=groundHeight-ballD/2;
    jumpTimer=0;
    up=false;
  }
  //----------------------------------------------------------------
  
  obstacle (400, groundHeight-50, 50, 50);
}

void keyPressed () {
  if (keyCode==RIGHT) right=true;
  if (keyCode==LEFT) left=true;
  if (keyCode==UP && jumpTimer==0) up=true;
}

void keyReleased () {
  if (keyCode==RIGHT) right=false;
  if (keyCode==LEFT) left=false;
}


void obstacle (int x, int y, int w, int h) {
  rect (x, y, w, h);
  if (ballX+ballD/2>x && ballX<x && ballY>groundHeight-ballD/2-h) {
    lives=lives-1;
    ballX=x-ballD/2-10;
  }
  if (ballX-ballD/2<x+w && ballX>x+w && ballY>groundHeight-ballD/2-h) {
    ballX=x+ballD/2+10+w;
  }
  
  
  
  //|| (ballX<x+w+ballD/2 && ballX>x+w)) {
  //  lives=lives-1;
  //}
}
