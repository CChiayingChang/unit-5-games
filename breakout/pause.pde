void pause () {
  fill (255);
  textSize (100);
  text ("PAUSED", 400, 400);
  tactileButton (725, 775, 725, 775);
  fill (0);
  rect (725, 725, 50, 50);
  strokeWeight (5);
  tactileText (725, 775, 725, 775);
  triangle (740, 740, 740, 760, 760, 750);
}

void pauseClick () {
  if (mouseX>725 && mouseX<775 && mouseX>725 && mouseX<775) mode=game;
}
