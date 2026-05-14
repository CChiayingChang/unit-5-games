void gameover () {
  background (0);
  if (leftscore>rightscore) {
    text ("left win", width/2, height/2);
  } else if (rightscore>leftscore) {
    text ("rightwin", width/2, height/2);
  }
}

void gameoverClick () {
  
}
