int mode;//keeps track of what screen youre on
//the different variables for each screen
final int intro=1; //final int locks the variable so that you don't accidentally change it later on-->will cause an error message if you try to change it
final int option=2;
final int game=3;
final int pause=4;
final int gameover=5;

int ballX;
int ballY;
int ballD;

boolean up;
boolean right;
boolean left;

boolean respawn;
int timer;

int groundHeight;

int jumpTimer;
int jump;

int lives;

//colour palette
color red=#EA0014;
color black=#000000;
color white=#FFFFFF;

int obstacleHeight;

void setup () {
  mode=game;
  
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
  
  timer=0;
  respawn=false;
  
  obstacleHeight=(groundHeight+25);
}

void draw () {
  if (mode==intro) {
    intro ();
  } else if (mode==option) {//the if else acts as a chain--> if it meets one condition, it won't check for the other conditions, so theres only ever one screen
    option ();
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


void door () {
  
}
