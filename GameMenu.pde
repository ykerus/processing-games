//Author: Yke Rusticus
//Date: October 2018

class GameMenu {
  
  int txtUp = 30;              //for text highlight
  int txtDown = 15;            //for text highlight
  int txtDist = 50;            //distance between text
    
  int SnWidth = 150;           //snake width
  int BrWidth = 250;           //breakout width
  int QtWidth = 150;           //quit width
    
  int relX = WIDTH/2;          //relative X
  int relY = HEIGHT/2;         //relative Y
    
  int ChY = 60;
  int SnY = relY - txtDist;    //snake Y
  int BrY = relY;              //breakout Y
  int QtY = relY + 4*txtDist;  //quit Y
    
  void drawMenu() {
    background(0);
    textAlign(CENTER);
    font = createFont("silom", 50);
    textFont(font);
    fill(255, 240, 0);
    text("Choose game", relX, ChY);
    font = createFont("silom", 32);
    textFont(font);
    fill(255);
    if (mouseX >= relX-SnWidth && mouseX <= relX+SnWidth 
        && mouseY >= SnY-txtUp && mouseY <= SnY+txtDown)
      fill(22, 50, 76);
    text("Snake", relX, SnY);
    fill(255);
    if (mouseX >= relX-BrWidth && mouseX <= relX+BrWidth 
        && mouseY >= BrY-txtUp && mouseY <= BrY+txtDown)
      fill(22,50, 76);
    text("Breakout", relX, BrY);
     fill(255);
    if (mouseX >= relX-QtWidth && mouseX <= relX+QtWidth 
        && mouseY >= QtY-txtUp && mouseY <= QtY+txtDown)
      fill(22,50, 76);
    text("-  Quit  -", relX, QtY);
  }//drawMenu
       
}//GameMenu
