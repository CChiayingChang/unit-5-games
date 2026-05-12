void intro () {
  background (0);
  textSize (100);
  fill (255);
  text ("PONG!", 500, 350);
  println (mouseX, mouseY);
  //1 player button
  rect (190, 460, 250, 75);
  fill (0);
  textSize (50);
  text ("1 player", 315, 510);
  //2 player button
  fill (255);
  rect (560, 460, 250, 75);
  fill (0);
  text ("2 players", 685, 510);
}

void introClick () {
  if (mouseX>190 && mouseX<440 && mouseY>460 && mouseY<535) {//if you click on the one player button
    mode=options;
  }
  if (mouseX>560 && mouseX<910 && mouseY>460 && mouseY<535) {//if you click on the one player button
    mode=options;
  }
}
