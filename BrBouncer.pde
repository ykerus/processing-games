//Author: Yke Rusticus
//Date: October 2018

class BrBouncer {
  
  int brWidth;   //width/thickness of bouncer
  int brLength;  //length of bouncer
  int brHeight;  //height of bouncer above ground
  int x, y;      //bouncer top left corner coords;
  
  BrBouncer() {
    brWidth = 10;
    brLength = 100;
    brHeight = brField.borderDist + brField.borderWidth + brWidth;
    x = mouseX;
    y = HEIGHT - brHeight;
  }//BrBouncer
  
  void getX() {
    if (mouseX <= WIDTH-brField.borderWidth-brField.borderDist-brLength 
        && mouseX >= brField.borderWidth+brField.borderDist)
      x = mouseX;
    else if (mouseX > WIDTH-brField.borderWidth-brField.borderDist-brLength)
      x = WIDTH-brField.borderWidth-brField.borderDist-brLength;
    else
      x = brField.borderWidth+brField.borderDist;
  }//getX
  
  void drawBouncer() {
    getX();
    rectMode(CORNERS);
    fill(255);
    stroke(255);
    rect(x, y, x+brLength, y+brWidth);
  }//drawB
  
}//BrBouncer
