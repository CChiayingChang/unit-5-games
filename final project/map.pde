void map () {
  background (black);
  image (dotted_line, 0, 100, width, height-200);
  tactileMap (130, 415, 100);
  level (level1, 130, 415, 100);
  tactileMap (435, 250, 100);
  level (level2, 435, 250, 100);
  tactileMap (725, 375, 100);
  level (level3, 725, 375, 100);
  fill (255);
  textSize (75);
  text ("1", 130, 415);
  text ("2", 435, 250);
  text ("3", 725, 375);
  println (mouseX, mouseY);
  
  //back button
  tactileButton (45, 145, 600, 650);
  rect (45, 600, 100, 50);
  fill (white);
  triangle (55, 625, 80, 610, 80, 640);
  rect (80, 620, 50, 10);
}

void mapClick () {
  if (dist(mouseX, mouseY, 130, 415)<50) {//if you click on level 1
   mode=game;
   ballX=100;
   //resets the obstacle height
   obstacleHeight=575;
   gap=false;//hide the gap again
   groundHeight=550;
   doorX=800;
   doorY=groundHeight-35;
  }
  if (dist(mouseX, mouseY, 435, 250)<50 && level2==true) {//if you click on level 2
    mode=game2;
    ballX=50;
    ballY=525;
    doorX=800;
    doorY=310;
    gap=false;
    moveDoor=false;
  }
  if (dist(mouseX, mouseY, 725, 375)<50 && level3==true) {//if you click on level 3
    mode=game3;
    ballX=100;
    ballY=475;
    obstacle3X=615;
    obstacle3Y=500;
    obstacle3Timer=0;
    stopJump=false;
  }
  if (mouseX>45 && mouseX<145 && mouseY>600 && mouseY<650) {
    mode=intro;
  }
}

void level (boolean level, int x, int y, int d) {
  //if you haven't completed the level yet, it's grey and inaccessible
  if (level==true) fill (red);
  else fill (grey);
  circle (x, y, d);
}
