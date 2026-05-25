//breakout

//colour palette
color red=#E00000;
color orange=#FF8503;
color yellow=#E0C600;
color green=#07D85C;
color blue=#0AAEED;
color purple=#A34FED;

//mode framework
int mode;
final int intro=1;
final int options=2;
final int game=3;
final int pause=4;
final int gameover=5;

//keyboard
boolean rightKey, leftKey;

//ball
float ballX, ballY, vx, vy, ballD;

//paddle
float paddleX, paddleD, paddleY;

//brick variables (array)
int [] x;//declaration-->allows you to declare x and y coordinates of all the bricks at once, instead of one at a time
int [] y;
int brickNumber;//for how many bricks there are
int tempx, tempy;//stores value of first brick
boolean [] hit; //keeps track if a brick has been hit or not

void setup () {
  mode=game;
  size (800, 800);
  paddleX=400;
  paddleD=100;
  ballX=400;
  ballY=400;
  vx=0;
  vy=10;
  ballD=15;
  paddleY=800;
  textAlign (CENTER);
  
  //setup array of bricks
  brickNumber=90;//how many bricks there are
  x=new int [brickNumber];//like an empty bok of xeroes, there are 3 pages
  y=new int [brickNumber];//instantiation
  hit= new boolean [brickNumber];
  
  tempx=50;
  tempy=75;
  for (int i=0; i<=brickNumber-1; i=i+1) {
    x[i]=tempx;//the coordinates of the first brick is equal to the coordinates of tempx and tempy
    y[i]=tempy;
    hit [i]=false;//the balls hhave not been hit yet
    tempx=tempx+50;//so the bricks change coordinates
    if (tempx==width) {//if the row exceeds the width, start the next row
      tempy=tempy+50;
      tempx=50;
    }
  }
}

void draw () {
  if (mode==intro) {
    intro ();
  } else if (mode==options) {
    options ();
  } else if (mode==game) {
    game ();
  } else if (mode==pause) {
    pause ();
  } else if (mode==gameover) {
    gameover ();
  }
}

void tactileButton (int xl, int xr, int yt, int yb) {
  noFill ();
  strokeWeight (3);
  if (mouseX>xl && mouseX<xr && mouseY>yt && mouseY<yb) {
    stroke (yellow);
  } else stroke (red);
}

void tactileText (int xl, int xr, int yt, int yb) {
  if (mouseX>xl && mouseX<xr && mouseY>yt && mouseY<yb) {
    fill (red);
  } else {
    fill (yellow);
  }
}
