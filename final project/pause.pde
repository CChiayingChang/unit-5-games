void pause () {
  fill (red);
  textSize (200);
  text ("PAUSED", 450, 250);
  
  tactileButton (56, 281, 400, 475);
  rect (56, 400, 225, 75);//resume button
  fill (white);
  text ("RESUME", 169, 438);
  
  tactileButton (337, 562, 400, 475);
  rect (337, 400, 225, 75);//restart button
  fill (white);
  text ("RESTART", 450, 438);
  
  tactileButton (619, 844, 400, 475);
  rect (619, 400, 225, 75);//map button
  fill (white);
  text ("MAP", 732, 438);
  
  println (mouseX, mouseY);
}

void pauseClick () {
  if (mouseX>56 && mouseX<281 && mouseY>400 && mouseY<475) {///if you click on resume
    mode=game;
  }
  if (mouseX>337 && mouseX<562 && mouseY>400 && mouseY<475) {
    mode=game;
    obstacleHeight=groundHeight+25;
    gap=false;
    ballX=100;
  }
  if (mouseX>619 && mouseX<844 && mouseY>400 && mouseY<475) {
    mode=map;
    obstacleHeight=groundHeight+25;
    gap=false;
    ballX=100;
  }
}
