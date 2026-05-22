void intro () {
  backgroundMusic.play ();
  background (0);
  outline ();
  textSize (150);
  fill (255);
  text ("PONG!", 500, 350);
  println (mouseX, mouseY);
  //1 player button
  tactilebutton (190, 440, 460, 535, 190, 460, 250, 75);
  tactiletext (190, 440, 460, 535);
  textSize (50);
  text ("1 player", 315, 510);
  //2 player button
  tactilebutton (560, 810, 460, 535, 560, 460, 250, 75);
  tactiletext (560, 810, 460, 535);
  text ("2 players", 685, 510);
  
  //audio
  win.pause ();//pauses the win sound
  win.rewind ();//rewinds wind sound for if you wanna play again
}

void introClick () {
  if (mouseX>190 && mouseX<440 && mouseY>460 && mouseY<535) {//if you click on the one player button
    mode=options;
    onePlayer=true;
    click ();
  }
  if (mouseX>560 && mouseX<910 && mouseY>460 && mouseY<535) {//if you click on the two player button
    mode=options;
    onePlayer=false;
    click ();
  }
}
