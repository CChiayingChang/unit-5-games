//new tab so you don't have to scroll a bunch
void intro () {
  background (0);
  rect (650, 700, 125, 50);
}

void introClick () {
  if (mouseX>650 && mouseX<775 && mouseY>700 && mouseY<750) {
    mode=option;
  }
}
