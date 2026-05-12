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

void setup () {
  size (1000, 700);
  mode=game;
  textAlign (CENTER);
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
