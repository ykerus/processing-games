//Author: Yke Rusticus
//Date: October 2018

class SnField {
  
  int borderDist;   //border distance from window edge
  int borderWidth;  //border thickness
 
  SnField() {
    borderDist = 30;
    borderWidth = 10;
  }//SnBackground
  
  void drawField() {
    rectMode(CORNERS);
    background(0);
    fill(22, 50, 76);
    stroke(22, 50, 76);
    rect(borderDist, borderDist, WIDTH-borderDist, borderDist+borderWidth);
    rect(borderDist, HEIGHT-borderDist-borderWidth, WIDTH-borderDist, HEIGHT-borderDist);
    rect(borderDist, borderDist, borderDist+borderWidth, HEIGHT-borderDist);
    rect(WIDTH-borderDist-borderWidth, borderDist, WIDTH-borderDist, HEIGHT-borderDist-borderWidth);  
  }//drawField
 
}//SnField
