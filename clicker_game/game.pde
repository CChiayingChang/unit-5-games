void game () {
  background (0);
  circle (x, y, d);
  
  //movements
  x=x+vx;
  y=y+vy;
  
  textSize (50);
  text ("Score:" + score, 700, 50);
  text ("Lives:" + lives, 100, 50);
  
  //bounce
  if (x<0+d/2 || x>width-d/2) {
    vx=-vx;
  }
  if (y<0+d/2 || y>height-d/2) {
    vy=-vy;
  }
  
  if (lives==0) mode=gameover;//if you have one line of code, no need for the braces
}

void gameClick () {

if (mouseX>x-d/2 && mouseX<x+d/2 && mouseY>y-d/2 && mouseY<y+d/2) {//if distance from mousX and mouseY from x and y is less than the radius
    vx=vx*1.5;
    vy=vy*1.5;
    score=score+1;
  } else {
    lives=lives-1;
  }
}

//add a restart button
