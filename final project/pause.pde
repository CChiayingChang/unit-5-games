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
    if (progress==1) mode=game;
    else if (progress==2) mode=game2;
    else if (progress==3) mode=game3;
  }
  if (mouseX>337 && mouseX<562 && mouseY>400 && mouseY<475) {//if you click on restart
  stopJump=false;
    if (progress==1) {
      mode=game;
      gap=false;
      ballX=100;
    }
    else if (progress==2) {
      mode=game2;
      ballY=525;
      ballX=100;
      doorX=800;
      doorY=310;
      gap=false;
      moveDoor=false;
    }
    else if (progress==3) {
      mode=game3;
      obstacle3Y=500;
      obstacle3X=615;
      ballX=100;
      ballY=475;
      stopJump=false;
      obstacle3Timer=0;
    }
    obstacleHeight=groundHeight+25;
    gap=false;
    ballX=100;
  }
  if (mouseX>619 && mouseX<844 && mouseY>400 && mouseY<475) {//if you click on map
    mode=map;
    obstacleHeight=groundHeight+25;
    gap=false;
    ballX=100;
  }
}
