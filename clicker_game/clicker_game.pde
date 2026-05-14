//import statements to connect sketch to library, for sound
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound variables
Minim minim;
AudioPlayer click, point, theme, lose, loselife;

int mode;//keeps track of what screen youre on
//the different variables for each screen
final int intro=1; //final int locks the variable so that you don't accidentally change it later on-->will cause an error message if you try to change it
final int option=2;
final int game=3;
final int pause=4;
final int gameover=5;

//colours
color red=#FF000D;
color yellow=#F0D400;

//target variables
float x, y, d, vx, vy, slider;

int score, lives, highscore;

//images
PImage pomni;
PImage jax;
PImage kinger;
PImage title;
PImage heart;
PImage grassbackground;
PImage gamebackground;
PImage hallway;
PImage abstracted;
int whatimage;

float a= random (0, TWO_PI);//generates random angle


void setup () {
  size (800, 800);
  mode=intro;
  textAlign (CENTER, CENTER);
  strokeWeight (4);
  //target variables
  x=width/2;
  y=height/2;
  d=100;
  vx=random (5*cos(a));//generates random x angle
  vy=random (5*sin(a));//generates random y angle
  
  score=0;
  lives=3;
  slider=570;
  
  //sound
  minim=new Minim (this);//connecting sketch to Minim
  click= minim.loadFile ("click.mp3");
  point=minim.loadFile ("poinit.mp3");
  theme=minim.loadFile ("theme.mp3");
  lose=minim.loadFile ("gameover.mp3");
  loselife=minim.loadFile ("loselife.mp3");
  
  //images
  pomni= loadImage ("pomni.png");
  jax= loadImage ("jax.png");
  kinger=loadImage ("kinger.png");
  title=loadImage ("title.png");
  grassbackground=loadImage ("grassbackground.jpeg");
  gamebackground=loadImage ("gamebackground.jpg");
  hallway=loadImage ("hallway.png");
  abstracted=loadImage ("abstracted.jpg");
  heart=loadImage ("heart.png");
  imageMode (CENTER);
  whatimage=1;
}

void draw () {
  if (mode==intro) {//for the mode framework
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

void tactilebutton (int xl, int xr, int yt, int yb) {//xleft, xright, ytop, ybottom
  //the button outlines and fill will switch colours when the mouse hovers over it
  if (mouseX>xl && mouseX<xr && mouseY>yt && mouseY<yb) {
    fill (yellow);
    stroke (red);
  } else {
    fill(red);
    stroke (yellow);
  }
}

void tactiletext (int xl, int xr, int yt, int yb) {//the text of buttons will switch colours when you hover over it
  if (mouseX>xl && mouseX<xr && mouseY>yt && mouseY<yb) {
    fill (red);
  } else {
    fill(yellow);
  }
}

void click () {
  click.rewind ();//resets the audio so you can play it more than once
  click.play ();
}
