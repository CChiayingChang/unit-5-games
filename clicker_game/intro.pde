//new tab so you don't have to scroll a bunch
void intro () {
  theme.play ();
  image (grassbackground, 400, 400, width, height);
  noStroke ();
  fill (0, 180);
  rect (0, 0, width, height, 10);
  textSize (90);
  fill (yellow);
  image (title, 400, 250, 525, 315);
  text ("CLICKER GAME", 400, 480);
  
  //for the start button
  tactilebutton (56, 371, 550, 700);
  rect (56, 550, 315, 150, 10);
  tactiletext (56, 371, 550, 700);
  text ("START", 215, 625);
  
  //for the option button
  tactilebutton (427, 742, 550, 700);
  rect (427, 550, 315, 150, 10);
  tactiletext (427, 742, 550, 700);
  text ("OPTION", 585, 625);
  println (mouseX, mouseY);

}

void introClick () {
  if (mouseX>427 && mouseX<742 && mouseY>550 && mouseY<700) {//option button
    mode=option;
    click.rewind ();//rewinds the audio so it can play more than once
    click.play ();
  }
  if (mouseX>56 && mouseX<371 && mouseY>550 && mouseY<700) {//start button
    mode=game;
    click.rewind ();
    click.play ();
  }
}

//maybe make the clicker game title alternating red and yellow?
