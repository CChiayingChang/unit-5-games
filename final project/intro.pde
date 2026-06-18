void intro () {
  background (0);
  background.play ();
  
  fill (139, 13, 13);
  textSize (250);
  text ("SIKE!", 460, 285);
  fill (red);
  text ("SIKE!", 450, 275);
  textSize (30);
  fill (white);
  text ("Avoid the hidden obstacles!", 450, 420);
  text ("Escape through the door", 450, 450);
  
  //start button
  noStroke ();
  fill (139, 13, 13);//offset dark rectangle
  rect (127, 510, 275, 100);
  tactileButton (117, 392, 500, 600);
  rect (117, 500, 275, 100);
  if (mouseX>117 && mouseX<392 && mouseY>500 && mouseY<600) textSize (90);
  else textSize (85);
  fill (white);
  text ("START", 255, 555);
  
  //map button
  noStroke ();
  fill (139, 13, 13);
  rect (519, 510, 275, 100);
  tactileButton (509, 784, 500, 600);
  rect (509, 500, 275, 100);
  if (mouseX>509 && mouseX<784 && mouseY>500 && mouseY<600) textSize (90);
  else textSize (85);
  fill (white);
  text ("MAP", 647, 555);
  
  println (mouseX, mouseY);
}

void introClick () {
  if (mouseX>130 && mouseX<380 && mouseY>500 && mouseY<600) {//if you click on start button
    reset1 ();
    click ();
  }
  if (mouseX>520 && mouseX<770 && mouseY>500 && mouseY<600) {//if you click on options button
    mode=map;
    click ();
  }
}
