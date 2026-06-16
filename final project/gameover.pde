void gameover () {
  background (black);
  textSize (100);
  text ("YOU WIN!", 450, 350);
  
  println (mouseX, mouseY);
  
  //restart button
  rect (37, 500, 250, 75);
  
  //map button
  rect (324, 500, 250, 75);
  
  //exit button
  rect (613, 500, 250, 75);
}

void gameoverClick () {

}
