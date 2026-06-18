void pause () {
  strokeWeight (2);
  
  textSize (200);
  text ("PAUSED", 450, 250);
  
  noBorder (54, 398, 229, 79);//so when you hover over the button it doens't leave behind a white border
  tactileButton (56, 281, 400, 475);
  rect (56, 400, 225, 75);//resume button
  fill (white);
  text ("RESUME", 169, 438);
  
  noBorder (335, 398, 229, 79);
  tactileButton (337, 562, 400, 475);
  rect (337, 400, 225, 75);//restart button
  fill (white);
  text ("RESTART", 450, 438);
  
  noBorder (617, 398, 229, 79);
  tactileButton (619, 844, 400, 475);
  rect (619, 400, 225, 75);//map button
  fill (white);
  text ("MAP", 732, 438);
  
  println (mouseX, mouseY);
}

void pauseClick () {
  if (mouseX>56 && mouseX<281 && mouseY>400 && mouseY<475) {//if you click on resume
    click ();
    if (progress==1) mode=game;
    else if (progress==2) mode=game2;
    else if (progress==3) mode=game3;
  }
  if (mouseX>337 && mouseX<562 && mouseY>400 && mouseY<475) {//if you click on restart
  click ();
    if (progress==1) {
      reset1 ();
    }
    else if (progress==2) {
      reset2 ();
    }
    else if (progress==3) {
      reset3 ();
    }
    click ();
  }
  if (mouseX>619 && mouseX<844 && mouseY>400 && mouseY<475) {//if you click on map
    mode=map;
    click ();
  }
}

void noBorder (int x, int y, int w, int h) {//because im not redrawing a background, when I hover over the buttons a white border appears, then it stays behind after. this gets rid of it
  fill (red);
  noStroke ();
  rect (x, y, w, h);
}
