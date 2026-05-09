void option () {
  background (0);
  textSize (100);
  fill (yellow);
  text ("OPTIONS", 400, 100);
  //left button
  tactilebutton (88, 238, 200, 350);
  rect (88, 200, 150, 150);
  image (pomni, 163, 275, 120*1.2, 120);
  
  //middle button
  tactilebutton (326, 476, 200, 350);
  rect (326, 200, 150, 150);
  image (jax, 401, 275, 120*1.2, 120);
  
  //right button
  tactilebutton (564, 714, 200, 350);
  rect (564, 200, 150, 150);
  image (kinger, 639, 275, 120*1.2, 120);
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
  tactilebutton (600, 750, 665, 740);
  rect (600, 665, 150, 75);
  textSize (50);
  tactiletext (600, 750, 665, 740);
  text ("START", 675, 700);
  
  //targets
  if (whatimage==1) {
    image (pomni, 400, 570, d*1.2, d);
  } else if (whatimage==2) {
    image (jax, 400, 570, d*1.2, d);
  } else if (whatimage==3) {
    image (kinger, 400, 570, d*1.2, d);
  }
  
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
  d=map(slider, 450, 700, 400, 50);//variable, range of slider, desired range
}

void optionClick () {
  if (mouseX>88 && mouseX<238 && mouseY>200 && mouseY<350) {
    whatimage=1;//if you click on the right button, image will show ponmi (the jester)
  }
  if (mouseX>326 && mouseX<476 && mouseY>200 && mouseY<350) {
    whatimage=2;//if you click on the middle button, the image will show jax (the purple bunny guy)
  }
  if (mouseX>564 && mouseX<714 && mouseY>200 && mouseY<350) {
    whatimage=3;//if you click on right button, image will show kinger (chess piece guy)
  }
  
  
  if (mouseX>600 && mouseX<750 && mouseY>665 && mouseY<740) {
    mode=game;
  }
}
