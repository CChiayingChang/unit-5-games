//mode framework
int mode;
final int intro=1;
final int options=2;
final int game=3;
final int pause=4;
final int gameover=5;

//colour palette
color magenta=#E600F7;
color blue=#03F4FF;

//player variables
float leftX, leftY, rightX, rightY, leftD, rightD;//paddles
float ballX, ballY, ballD; //ball

//keyboard variables
boolean wKey, sKey, upKey, downKey;//use booleans for the keys so that theres no key repeat delay

//movement variables
float a= random (QUARTER_PI, HALF_PI+QUARTER_PI);//generates random angle
float vx;
float vy;

int leftscore, rightscore, timer;

float sliderY;
float sliderY2;

boolean onePlayer;

void setup () {
  size (1000, 700);
  mode=options;
  textAlign (CENTER);
  strokeWeight (3);
  
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
  
  //movement
  vx=random (10*cos(a));//generates random x angle
  vy=random (10*sin(a));//generates random y angle
  textAlign (CENTER);
  
  rightscore=0;
  leftscore=0;
  timer=100;
  
  sliderY=397;
  sliderY2=397;
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

void tactilebutton (int xl, int xr, int yt, int yb) {
  if (mouseX>xl && mouseX<xr && mouseY>yt && mouseY<yb){
    stroke (blue);
    noFill ();
  } else {
    stroke (magenta);
    noFill ();
  }
}

void tactiletext (int xl, int xr, int yt, int yb) {
  if (mouseX>xl && mouseX<xr && mouseY>yt && mouseY<yb) {
    fill (magenta);
  } else {
    fill (blue);
  }
}

void tactileslider (int xl, int xr, int yt, int yb) {
  if (mouseX>xl && mouseX<xr && mouseY>yt && mouseY<yb) {
    stroke (blue);
    fill (blue);
  } else {
    stroke (magenta);
    fill (magenta);
  }
}
