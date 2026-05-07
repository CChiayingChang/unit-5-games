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
  
  //middle button
  if (mouseX>326 && mouseX<476 && mouseY>200 && mouseY<350) {
  fill (yellow);
  stroke (red);
  } else {
    fill (red);
    stroke (yellow);
  }
  rect (326, 200, 150, 150);
  
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
  line (167, 450, 167, 700);
  circle (167, slider, 40);
}

void mousePressed () {
  moveslider ();
}

void mouseDragged () 

void moveslider () {
  if (dist(mouseX, mouseY, 167, slider)<20) {
    slider=mouseY;
  }
  d=map (slider, 450, 700, 150, 50);//variable, range of slider, desired range
}

void optionClick () {

}
