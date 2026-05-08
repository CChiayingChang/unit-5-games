void option () {
  background (0);
  textSize (100);
  fill (yellow);
  text ("OPTIONS", 400, 100);
  //left button
  if (mouseX>88 && mouseX<238 && mouseY>200 && mouseY<350) {
  fill (yellow);
  stroke (red);
  } else {
    fill (red);
    stroke (yellow);
  }
  rect (88, 200, 150, 150);
  image (pomni, 163, 275, 120*1.2, 120);
  
  //middle button
  if (mouseX>326 && mouseX<476 && mouseY>200 && mouseY<350) {
  fill (yellow);
  stroke (red);
  } else {
    fill (red);
    stroke (yellow);
  }
  rect (326, 200, 150, 150);
  image (jax, 401, 275, 120*1.2, 120);
  
  //right button
  if (mouseX>564 && mouseX<714 && mouseY>200 && mouseY<350) {
  fill (yellow);
  stroke (red);
  } else {
    fill (red);
    stroke (yellow);
  }
  rect (564, 200, 150, 150);
  println (mouseX, mouseY);
  
  //slider
  if (mouseX>147 && mouseX<187 && mouseY>430 && mouseY<720) {
    stroke (red);
    fill (yellow);
  } else {
    fill (red);
    stroke (yellow);
  }
  line (167, 450, 167, 700);
  circle (167, slider, 40);
  
  //start button
  if (mouseX>600 && mouseX<750 && mouseY>665 && mouseY<740) {
    fill (yellow);
    stroke (red);
  } else {
    fill (red);
    stroke (yellow);
  }
  rect (600, 665, 150, 75);
  textSize (50);
  //text for start button
  if (mouseX>600 && mouseX<750 && mouseY>665 && mouseY<740) {
    fill (red);
  } else {
    fill (yellow);
  }
  text ("START", 675, 700);
}

void mousePressed () {
  moveslider ();
}

void mouseDragged () {
  moveslider ();
}

void moveslider () {
  if (dist(mouseX, mouseY, 167, slider)<20 && mouseY>450 && mouseY<700 && mode==option) {//onyl works if the mouse is on slider line (y) and within 20 units (x)
  //make sure it only works on option screen
    slider=mouseY;
  }
  d=map (slider, 450, 700, 150, 50);//variable, range of slider, desired range
}

void optionClick () {
  if (mouseX>88 && mouseX<238 && mouseY>200 && mouseY<350) {
    whatimage=1;//if you click on the clown button, the image will be a  clown
  }
}
