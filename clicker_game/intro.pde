//new tab so you don't have to scroll a bunch
void intro () {
  theme.play ();
  lose.pause ();//pauses it so the sound doesn/'t play, otherwise when you restart the game it'll play over and over again, glitchy sound
  lose.rewind ();//rewinds you llose audio so if you play the game again after you die, the audio still works
  
  //background image
  image (grassbackground, 400, 400, width, height);
  noStroke ();
  fill (0, 180);
  rect (0, 0, width, height, 10);
  
  //title
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
    click ();
  }
  if (mouseX>56 && mouseX<371 && mouseY>550 && mouseY<700) {//start button
    mode=game;
    click ();
  }
}

//maybe make the clicker game title alternating red and yellow?
