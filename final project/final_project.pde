//level devil inspired
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode;//keeps track of what screen youre on
//the different variables for each screen
final int intro=1; //final int locks the variable so that you don't accidentally change it later on-->will cause an error message if you try to change it
final int map=2;
final int game=3;
final int pause=4;
final int gameover=5;
final int game2=6;
final int game3=7;

int ballX;
int ballY;
int ballD;

int doorX, doorY;//coordinates for the door

//keyboard
boolean up;//if up=true, jump; else, don't jump
boolean right;
boolean left;

//colour palette
color red=#EA0014;
color black=#000000;
color white=#FFFFFF;
color brown=#90621C;
color blue=#2ADAF7;
color grey=#AAAAAA;

boolean respawn;//when respawn=false, show character; when respawn=true, don't show character-->gives pause after death
int timer;//timer for when you die-->when you die respawn=true and timer starts, when timer is up respawn=false

int groundHeight;
int jumpTimer;//timing for the jumping-->rising, falling

boolean gap;//if you pass the gap, this=true. when this is true, show the gap-->this way it doesn't disappear when you move back before the gap

//checks if you completed a level or not
boolean level1;
boolean level2;
boolean level3;

PImage dotted_line;

int progress;//for keeping track of what level to go to in pause

PFont font;

boolean stopJump;//prevents you from being able to jump if you're in a gap

//sound effects
Minim sounds;
AudioPlayer click, background, loselife, door, win;
PImage trophy;//background for gameover

int deaths;//to count how many times you died in the game


//level 1 variables----------------------------------------------------------------------------
int platformHeight;
int obstacleHeight;//for the obstacle in level 1 and 2

int obstacleX;//for the small osbtacle in level 3
int obstacleY;//for the small obstacle in level 3

//level 2 variables----------------------------------------------------------------------------
boolean moveDoor;
int crushTimer;//for the timer for the platform that crushes you
boolean crush;//will determine if platform should crush you or not

//level 3 variables--------------------------------------------
int obstacle3X;//for the x coordiante of the obstacle in level 3
int obstacle3Y;//for the y value of the obstacle in level 3
int obstacle3Timer;//to make the obstacle pause before it disappears
boolean moveobstacle3;//for movign the big obstacle in level 3
boolean smallObstacle;//for the 2nd obstacle in level 3

void setup () {
  mode=game2;
  
  size (900, 700);
  textAlign (CENTER, CENTER); //horizontal, vertical
  
  font=createFont ("boston/BOSTON CAPS.ttf", 50);
  textFont (font);
  
  //for the keyboard
  up=false;
  right=false;
  left=false;
  
  jumpTimer=0;//for the timing of up and down for jumping
  
  ballX=100;
  ballY=groundHeight-25;
  ballD=50;
  
  //respawn variables
  timer=0;//when you die times the character's reappearance
  respawn=false;

  gap=false;
  
  //for the colours of the levels on the map
  level1=true;
  level2=false;
  level3=false;
  
  dotted_line=loadImage ("dotted_line.png");
  
  progress=1;
  
  doorX=800;
  doorY=groundHeight-35;
  
  stopJump=false;
  
  //sound effects
  sounds=new Minim (this);
  click=sounds.loadFile ("click.mp3");
  door=sounds.loadFile ("door.mp3");
  loselife=sounds.loadFile ("loselife.mp3");
  win=sounds.loadFile ("win.mp3");
  background=sounds.loadFile ("background.mp3");
  
  trophy=loadImage ("trophy.jpg");
  deaths=0;
  
  //level 1 variables---------------------------------
  groundHeight=550;
  obstacleHeight=(groundHeight+25);
  
  //level 2 variables--------------------------------
  platformHeight=550;//for the floating platforms
  moveDoor=false;
  crushTimer=0;
  crush=false;
  
  //level 3 variables-------------------------------------------
  //the big obstacle in level 3
  obstacle3X=615;
  obstacle3Y=500;
  moveobstacle3=false;
  obstacle3Timer=0;
  smallObstacle=false;
  obstacleX=150;
  obstacleY=500;
}

void draw () {
  if (mode==intro) {
    intro ();
  } else if (mode==map) {//the if else acts as a chain--> if it meets one condition, it won't check for the other conditions, so theres only ever one screen
    map ();
  } else if (mode==game) {
    game ();
  } else if (mode==game2) {
    game2 ();
  }else if (mode==game3) {
    game3 ();
  }else if(mode==pause) {
    pause ();
  } else if (mode==gameover) {
    gameover ();
  } else {
    println ("Error: Mode = " + mode);
  }
}

void door (int x, int y) {
  rectMode (CENTER);
  fill (brown);
  rect (x, y, 45, 70, 50, 50, 0, 0);
  fill (blue);
  rect (x, y+3, 30, 63, 50, 50, 0, 0);
  rectMode (CORNER);
}

void tactileButton (int xl, int xr, int yt, int yb) {
  fill (red);
  strokeWeight (3);
  if (mouseX>xl-5 && mouseX<xr+5 && mouseY>yt-5 && mouseY<yb+5) {
    stroke (white);
    textSize (60);
  } else {
    noStroke ();
    textSize (55);
  }
}

void menu () {
  stroke (white);
  if (mouseX>845-5 && mouseX<875+5 && mouseY>25-5 && mouseY<45+5) strokeWeight (4); //makes it tactile
  else strokeWeight (2);
  line (845, 25, 875, 25);
  line (845, 35, 875, 35);
  line (845, 45, 875, 45);
  noStroke ();
}

void click () {
  click.rewind ();
  click.play ();
}

void door () {
  door.rewind ();
  door.play ();
}

void die () {
  loselife.rewind ();
  loselife.play ();
}

void reset1 () {
  mode=game;
  ballX=100;
  //resets the obstacle height
  obstacleHeight=575;
  gap=false;//hide the gap again
  groundHeight=550;
  doorX=800;
  doorY=groundHeight-35;
  respawn=false;
  timer=0;
  stopJump=false;
}

void reset2 () {
  mode=game2;
  //sets the coordinates of the door for the next level
  doorX=800;
  doorY=310;
  //sets ball coordinates for next level
  ballX=50;
  ballY=535;
  gap=false;
  respawn=false;
  timer=0;
  moveDoor=false;
  stopJump=false;
  obstacleHeight=430;
  crushTimer=0;
  groundHeight=650;
  crush=false;
}

void reset3 () {
  mode=game3;
  respawn=false;
  ballX=100;
  ballY=475;
  smallObstacle=false;
  obstacle3X=615;
  obstacle3Y=500;
  obstacle3Timer=0;
  smallObstacle=false;
  gap=false;
  timer=0;
  moveobstacle3=false;
  stopJump=false;
  obstacleY=500;
  obstacleX=150;
}
