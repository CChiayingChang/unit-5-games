import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode framework
int mode;
final int intro=1;
final int options=2;
final int game=3;
final int pause=4;
final int gameover=5;

//colour palette
color magenta=#FF00DE;
color blue=#03F4FF;
color purple=#A900FF;

//player variables
float leftX, leftY, rightX, rightY, leftD, rightD;//paddles
float ballX, ballY, ballD; //ball

//keyboard variables
boolean wKey, sKey, upKey, downKey;//use booleans for the keys so that theres no key repeat delay

//movement variables
float a= random (0, TWO_PI);//generates random angle
//have 2 Y angle ranges-->one for left, one for right, so it can't generate any vertical moving balls (cause then it gets stuck bouncing up and down)
float aYminus = random (HALF_PI+QUARTER_PI, PI+QUARTER_PI);
float aYplus=random (TWO_PI+QUARTER_PI);
float vx;
float vy;

int leftscore, rightscore, timer;

float sliderY;
float sliderY2;

boolean onePlayer;

int speed;//variabl changes depending on what speed option you choose
int howFast; //the amount you add to speed depending on what speed option you chose
float direction;

//sound
Minim minim;
AudioPlayer click, point, pingpong, win;//sound variables

PFont font;

void setup () {
  size (1000, 700);
  mode=intro;
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
  randomDirection ();
  
  
  textAlign (CENTER);
  
  rightscore=0;
  leftscore=0;
  timer=100;
  
  sliderY=397;
  sliderY2=397;
  
  speed=1;
  
  //sound
  minim= new Minim (this); //connecting sketch to Minim
  click=minim.loadFile ("click.mp3");
  point=minim.loadFile ("point.mp3");
  win=minim.loadFile ("win.mp3");
  pingpong=minim.loadFile ("pingpong.mp3");
  
  font=createFont ("Pix32.ttf", 150);
  textFont (font);
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
  if (mouseX>xl-5 && mouseX<xr+5 && mouseY>yt-5 && mouseY<yb+5){//+-5 for strokeWeight
    stroke (magenta);
    noFill ();
  } else {
    stroke (blue);
    noFill ();
  }
}

void tactiletext (int xl, int xr, int yt, int yb) {
  strokeWeight (5);
  if (mouseX>xl-5 && mouseX<xr+5 && mouseY>yt-5 && mouseY<yb+5) {
    fill (blue);
  } else {
    fill (magenta);
  }
}

void tactileslider (int xl, int xr, int yt, int yb) {
  if (mouseX>xl && mouseX<xr && mouseY>yt && mouseY<yb) {
    stroke (magenta);
    fill (magenta);
  } else {
    stroke (blue);
    fill (blue);
  }
}

void pingpong () {
  pingpong.rewind ();
  pingpong.play ();
}

void click () {
  click.rewind ();
  click.play ();
}

void randomDirection () {
  direction=random (0, 10);//chooses random number
  vx=random (10*cos(a));//generates random x angle+the speed you chose
  if (direction<5) {//if direction was below 5, the ball moves left
    vy=random (10*sin(aYminus));
  } else if (direction>5) {//if direction was above 5, ball moves right-->this stuff prevents up and down bouncing
    vy=random (10*sin(aYplus));
  }
}



//fix starting speed
