//breakout

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

void setup () {
  mode=intro;
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
