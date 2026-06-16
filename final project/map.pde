void map () {
  background (black);
  image (dotted_line, 0, 100, width, height-200);
  
  tactileMap (130, 415, 100, level1);
  level (level1, 130, 415, 100);
  fill (white);
  text ("1", 130, 415);
  
  tactileMap (435, 250, 100, level2);
  level (level2, 435, 250, 100);
  fill (white);
  text ("2", 435, 250);
  
  tactileMap (725, 375, 100, level3);
  level (level3, 725, 375, 100);
  fill (white);
  text ("3", 725, 375);
  println (mouseX, mouseY);
  
  //back button
  tactileButton (45, 145, 600, 650);
  rect (45, 600, 100, 50);
  fill (white);
  triangle (55, 625, 80, 610, 80, 640);
  rect (80, 620, 50, 10);
  
  //exit button
  tactileButton (755, 855, 600, 650);
  rect (755, 600, 100, 50);
  fill (white);
  if (mouseX>755 && mouseX<855 && mouseY>600 && mouseY<650) textSize (45);
   else textSize (40);
  text ("EXIT", 805, 627);
}

void mapClick () {
  if (dist(mouseX, mouseY, 130, 415)<50) {//if you click on level 1
   reset1 ();
   click ();
  }
  if (dist(mouseX, mouseY, 435, 250)<50 && level2==true) {//if you click on level 2
    reset2 ();
    click ();
  }
  if (dist(mouseX, mouseY, 725, 375)<50 && level3==true) {//if you click on level 3
    reset3 ();
    click ();
  }
  if (mouseX>45 && mouseX<145 && mouseY>600 && mouseY<650) {//if you click the back button
    mode=intro;
    click ();
  }
  
  if (mouseX>755 && mouseX<855 && mouseY>600 && mouseY<650) exit ();
}

void level (boolean level, int x, int y, int d) {
  //if you haven't completed the level yet, it's grey and inaccessible
  if (level==true) fill (red);
  else fill (grey);
  circle (x, y, d);
  if (dist(mouseX, mouseY, x, y)<d/2 && level==true) textSize (80);
  else textSize (75);
}

void tactileMap (int x, int y, int d, boolean level) {
  if (dist(x, y, mouseX, mouseY)<d/2 && level==true) {
    stroke (white);
  } else {
    noStroke ();
  }
}
