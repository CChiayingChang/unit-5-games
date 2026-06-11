void intro () {
  background (0);
  
  fill (red);
  textSize (200);
  text ("SIKE", 450, 275);
  textSize (30);
  fill (white);
  text ("Avoid the hidden obstacles!", 450, 400);
  text ("Escape through the door", 450, 430);
  
  //start button
  tactileButton (117, 392, 500, 600);
  rect (117, 500, 275, 100);
  fill (white);
  text ("START", 255, 550);
  
  //options button
  tactileButton (509, 784, 500, 600);
  rect (509, 500, 275, 100);
  fill (white);
  text ("MAP", 647, 550);
  
  println (mouseX, mouseY);
}

void introClick () {
  if (mouseX>130 && mouseX<380 && mouseY>500 && mouseY<600) {//if you click on start button
    mode=game;
  }
  if (mouseX>520 && mouseX<770 && mouseY>500 && mouseY<600) {//if you click on options button
    mode=map;
  }
}
