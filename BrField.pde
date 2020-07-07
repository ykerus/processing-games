//Author: Yke Rusticus
//Date: October 2018

class BrField {
  
  int borderDist;
  int borderWidth;
  
  BrField() {
    borderDist = 30;
    borderWidth = 10;
  }//BrField
  
  void drawField() {
    rectMode(CORNERS);
    background(0);
    fill(22, 50, 76);
    stroke(22, 50, 76);
    rect(borderDist, borderDist, WIDTH-borderDist, borderDist+borderWidth);
    rect(borderDist, borderDist, borderDist+borderWidth, HEIGHT-borderDist);
    rect(WIDTH-borderDist-borderWidth, borderDist, WIDTH-borderDist, HEIGHT-borderDist);
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rect(borderDist, HEIGHT-borderDist-2*borderWidth, borderDist+borderWidth, HEIGHT-borderDist);
    rect(WIDTH-borderDist-borderWidth, HEIGHT-borderDist-2*borderWidth, WIDTH-borderDist, HEIGHT-borderDist); 
  }//drawField
  
}//BrField
