void options () {
  background (0);
  println (mouseX, mouseY);
  textSize (150);
  fill (255);
  text ("OPTIONS", 500, 150);
  strokeWeight (5);
  stroke (255);
  
  //slider for paddle size
  tactileslider (75, 125, 220, 575);
  line (100, 575, 100, 220);
  circle (100, sliderY, 25);
  noStroke ();
  fill (255);
  imageMode (CENTER);
  image (paddle, leftD/4+140, 397, leftD/2, leftD);
  leftD=map (sliderY, 575, 220, 100, 300);
  
  //slider for ball size
  tactileslider (355, 405, 220, 575);
  line (380, 575, 380, 220);
  circle (380, sliderY2, 25);
  noStroke ();
  fill (255);
  image (ball, 460, 397, ballD, ballD);//ball
  imageMode (CORNER);
  ballD=map (sliderY2, 575, 220, 10, 100);
  
  //start button
  tactilebutton (795, 955, 590, 665, 795, 590, 160, 75);
  tactiletext (795, 955, 590, 665);
  textSize (50);
  text ("START", 875, 642);
  fill (255);
  
  textSize (60);
  text ("SPEED", 750, 250);//options for speed of ball
  speed (1);
  rect (585, 285, 100, 100, 25);//round corners so the fill doesn't show past borders
  tactilebutton (585, 685, 285, 385, 585, 285, 100, 100);
  tactiletext (585, 685, 285, 385);
  text ("1", 635, 350);
  
  speed (2);//will change the button fil to purple if pressed
  rect (705, 285, 100, 100, 25);
  tactilebutton (705, 805, 285, 385, 705, 285, 100, 100);
  tactiletext (705, 805, 285, 385);
  text ("2", 755, 350);
  
  speed (3);
  rect (825, 285, 100, 100, 25);
  tactilebutton (825, 925, 285, 385, 825, 285, 100, 100);
  tactiletext (825, 925, 285, 385);
  text ("3", 875, 350);
}

void optionsClick () {
  if (mouseX>795 && mouseX<955 && mouseY>590 && mouseY<665) {//click on start
    mode=game;
    click ();
    timer=100;
  }
  
  //speed buttons
  if (mouseX>585 && mouseX<685 && mouseY>285 && mouseY<385) {
    speed=1;
    click ();
  } else if (mouseX>705 && mouseX<805 && mouseY>285 && mouseY<385) {
    speed=2;
    click ();
  } else if (mouseX>825 && mouseX<925 && mouseY>285 && mouseY<385) {
    speed=3;
    click ();
  }
}

void slider () {
  if (dist(mouseX, mouseY, 100, sliderY) <13 && mode==options && mouseY>220 && mouseY<575) {
    sliderY=mouseY;
    click ();
  }
  if (dist (mouseX, mouseY, 380, sliderY2) <13 && mode==options && mouseY>220 && mouseY<575) {
    sliderY2=mouseY;
    click ();
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
