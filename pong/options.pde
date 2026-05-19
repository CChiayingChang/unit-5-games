void options () {
  background (0);
  println (mouseX, mouseY);
  textSize (100);
  text ("OPTIONS", 500, 125);
  strokeWeight (5);
  stroke (255);
  
  //slider for paddle size
  tactileslider (75, 125, 220, 575);
  line (100, 575, 100, 220);
  circle (100, sliderY, 25);
  noStroke ();
  fill (255);
  arc (165, 397, leftD, leftD, PI+HALF_PI, TWO_PI+HALF_PI);
  leftD=map (sliderY, 575, 220, 100, 300);
  
  //slider for ball size
  tactileslider (355, 405, 220, 575);
  line (380, 575, 380, 220);
  circle (380, sliderY2, 25);
  noStroke ();
  fill (255);
  circle (460, 397, ballD);//ball
  ballD=map (sliderY2, 575, 220, 10, 100);
  
  //start button
  tactilebutton (795, 955, 590, 665);
  rect (795, 590, 160, 75);
  tactiletext (795, 955, 590, 665);
  textSize (50);
  text ("START", 875, 642);
  fill (255);
  
  textSize (60);
  text ("SPEED", 750, 250);//options for speed of ball
  tactilebutton (585, 685, 285, 385);
  t
  rect (585, 285, 100, 100);
  tactilebutton (705, 805, 285, 385);
  rect (705, 285, 100, 100);
  tactilebutton (825, 925, 285, 385);
  rect (825, 285, 100, 100);
}

void optionsClick () {
  if (mouseX>795 && mouseX<955 && mouseY>590 && mouseY<665) {
    mode=game;
  }
}

void slider () {
  if (dist(mouseX, mouseY, 100, sliderY) <13 && mode==options && mouseY>220 && mouseY<575) {
    sliderY=mouseY;
  }
  if (dist (mouseX, mouseY, 380, sliderY2) <13 && mode==options && mouseY>220 && mouseY<575) {
    sliderY2=mouseY;
  }
}

void mouseDragged () {
  slider ();
}
//add difficulty level for speed of ball
//add difficulty level for how many balls
//paddle size
//ball size
//different choicces for ball?
