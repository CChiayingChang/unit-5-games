//breakout

//colour palette
color red=#E00000;
color yellow=#E0C600;

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
float paddleX;
float paddleD;
float paddleY;

//brick variables (array)
int [] x;//declaration-->allows you to declare x and y coordinates of all the bricks at once, instead of one at a time
int [] y;
int brickNumber;//for how many bricks there are

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
  brickNumber=4;
  x=new int [brickNumber];//like an empty bok of xeroes, there are 3 pages
  y=new int [brickNumber];//instantiation
  
  x[0]=100;//kind of like first page of book, x coordinates of 1st brick is 100
  y[0]=100;//y coordinate of 1st brick is 100
  
  x[1]=300;//x coordinates of 2nd brick is 200
  y[1]=100;//y coordinates of 2nd brick is 100;
  
  x[2]=500;
  y[2]=100;
  
  x[3]=700;
  y[3]=100;
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
