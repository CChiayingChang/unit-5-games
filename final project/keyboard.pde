void keyPressed () {
  if (keyCode==RIGHT) right=true;
  if (keyCode==LEFT) left=true;
  if (keyCode==UP && jumpTimer==0) up=true;
}

void keyReleased () {
  if (keyCode==RIGHT) right=false;
  if (keyCode==LEFT) left=false;
}
