//new tab so you don't have to scroll a bunch
void intro () {
  theme.play ();
  background (0);
  textSize (90);
  fill (yellow);
  text ("Clicker Game", 400, 300);
  
  //for the start button
  if (mouseX>56 && mouseX<371 && mouseY> 500 && mouseY<650) {
    fill (yellow);
    stroke (red);
  } else {
    fill (red);
    stroke (yellow);
  }
  rect (56, 500, 315, 150);
  if (mouseX>56 && mouseX<371 && mouseY>500 && mouseY<650) {
    stroke (red);
    fill (red);
  } else {
    stroke (yellow);
    fill (yellow);
  }
  text ("START", 215, 575);
  
  //for the option button
  if (mouseX>427 && mouseX<742 && mouseY>500 && mouseY<650) {
    fill (yellow);
    stroke (red);
  } else {
    fill (red);
    stroke (yellow);
  }
  rect (427, 500, 315, 150);
  
  if (mouseX>427 && mouseX<742 && mouseY>500 && mouseY<650) {
    stroke (red);
    fill (red);
  } else {
    stroke (yellow);
    fill (yellow);
  }
  text ("OPTION", 585, 575);
  
  println (mouseX, mouseY);

}

void introClick () {
  if (mouseX>427 && mouseX<742 && mouseY>500 && mouseY<650) {//option button
    mode=option;
    click.rewind ();//rewinds the audio so it can play more than once
    click.play ();
  }
  if (mouseX>56 && mouseX<371 && mouseY>500 && mouseY<650) {//start button
    mode=game;
    click.rewind ();
    click.play ();
  }
}

//maybe make the clicker game title alternating red and yellow?
