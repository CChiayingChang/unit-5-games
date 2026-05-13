void keyPressed () {//built in function
  //can skip braces if you have exactly one line of code
  if (key=='w' || key=='W') wKey=true;
  if (key=='s' || key=='S') sKey=true;
  if (keyCode==UP) upKey=true;//keyCode is another built in thing, this is for up key
  if (keyCode==DOWN) downKey=true;//for the down key
}

void keyReleased () {//built in function
  if (key=='w' || key=='W') wKey=false;
  if (key=='s' || key=='S') sKey=false;
  if (keyCode==UP) upKey=false;
  if (keyCode==DOWN) downKey=false;
}

//use boolean variables instead of doing 
  //if (key=='w' || key=='W') leftY=leftY-10;
  //if (key=='s' || key=='S') leftY=leftY+10;
//because then there will be a delay when you move
