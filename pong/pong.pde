//mode framework
int mode;
final int intro=1;
final int options=2;
final int game=3;
final int pause=4;
final int gameover=5;

//player variables
float leftX, leftY, rightX, rightY, leftD, rightD;//paddles
float ballX, ballY, ballD; //ball

//keyboard variables
boolean wKey, sKey, upKey, downKey;//use booleans for the keys so that theres no key repeat delay

void setup () {
  size (1000, 700);
  mode=game;
  textAlign (CENTER);
  
  //paddles
  leftX=0;
  leftY=height/2;
  leftD=200;
  
  rightX=width;
  rightY=height/2;
  rightD=200;
  
  //ball
  ballX=width/2;
  ballY=height/2;
  ballD=50;
  
  //keyboard setup
  wKey=sKey=upKey=downKey=false;
}

void draw () {
  if (mode==intro) {
    intro ();
  } else if (mode==options) {
    options();
  } else if (mode==game) {
    game ();
  } else if (mode==pause) {
    pause ();
  } else if (mode==gameover) {
    gameover ();
  } else {
    println ("Error: Mode = " + mode);
  }
}

void tactilebutton () {
  
}
