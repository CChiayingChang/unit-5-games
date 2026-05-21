void keyPressed () {
  if (keyCode==RIGHT) rightKey=true;//if you press hte right key, then it sets the variable rightKey to true
  if (keyCode==LEFT) leftKey=true;
}

void keyReleased () {
  if (keyCode==RIGHT) rightKey=false;
  if (keyCode==LEFT) leftKey=false;
}
