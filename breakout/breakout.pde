import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

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

int points, lives;

//gifs
PImage [] winGif;//the array for the winning gif
int fNumWIN;//how many frames there are in the win gif
int whichFwin;//which frame is playing for the win gif

//intro gif
PImage [] zoom;
int frameszoom;//how many frames for the zoom gif
int whichzoom;//which frame of the zoom gif is playing

Minim minim;
AudioPlayer click, point, loselife, win, lose, background, collide;

PFont font;
PImage trophy;
PImage disappointed;

void setup () {
  //gif win
  fNumWIN=30;
  winGif=new PImage [fNumWIN];
  for (int i=0; i<=fNumWIN-1; i+=1) {
    winGif [i]=loadImage ("frame_"+i+"_delay-0.07s.gif");
  }
  whichFwin=0;
  
  frameszoom=28;
  zoom= new PImage [frameszoom];
  for (int i=0; i<=frameszoom-1; i+=1) {
    zoom [i]=loadImage ("zooming/frame_"+i+"_delay-0.05s.gif");
  }
  
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
  
  points=0;
  lives=5;
  textAlign (CENTER);
  
  minim= new Minim (this);
  click=minim.loadFile ("click.mp3");
  collide=minim.loadFile ("hit.mp3");
  point=minim.loadFile ("points.mp3");
  loselife=minim.loadFile ("loselife.mp3");
  win=minim.loadFile ("win.mp3");
  lose=minim.loadFile ("lose.mp3");
  background=minim.loadFile ("intro.mp3");
  
  font=createFont ("dungeon/dungeon.ttf", 100);
  textFont (font);
  trophy=loadImage ("trophy.png");
  disappointed=loadImage ("disappointed.png");
}

void draw () {
  if (mode==intro) {
    intro ();
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
    stroke (purple);
  } else stroke (blue);
}

void tactileText (int xl, int xr, int yt, int yb) {
  if (mouseX>xl && mouseX<xr && mouseY>yt && mouseY<yb) {
    fill (yellow);
    stroke (yellow);
  } else {
    stroke (orange);
    fill (orange);
  }
}

void click () {
  click.rewind ();
  click.play ();
}

void collide () {
  collide.rewind ();
  collide.play ();
}

//to do:design
