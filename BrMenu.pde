//Author: Yke Rusticus
//Date: October 2018

class BrMenu {
  
  int startTxtWidth;
  int startTxtHeight;
  int overTxtWidth;
  int overTxtHeight;
  
  BrMenu() {
    startTxtWidth = 200;
    startTxtHeight = 100;
    overTxtWidth = 200;
    overTxtHeight = 100;
  }//BrMenu
  
  void drawMenu() {
    font = createFont("silom", 32);
    textAlign(CENTER);
    textFont(font);
    fill(255);
    if (mouseX >= WIDTH/2-startTxtWidth/2 && mouseX <= WIDTH/2+startTxtWidth/2 
        && mouseY >= HEIGHT/2-startTxtHeight/2 && mouseY <= HEIGHT/2+startTxtHeight/2)
      fill(22, 50, 76);
    text("Start game", WIDTH/2, HEIGHT/2);
    font = createFont("silom", 25);
    textFont(font);
    fill(255);
    if (mouseX >= brField.borderDist+brField.borderWidth+50-startTxtWidth/2 
        && mouseX <= brField.borderDist+brField.borderWidth+50+startTxtWidth/2 
        && mouseY >= HEIGHT-brField.borderDist+brField.borderWidth-30-startTxtHeight/2 
        && mouseY <= HEIGHT-brField.borderDist+brField.borderWidth-30+startTxtHeight/2)
      fill(22, 50, 76);
    text("Back", brField.borderDist+brField.borderWidth+50, 
          HEIGHT-brField.borderDist+brField.borderWidth-40);
  }//drawMenu
  
    void drawGameOver() {
    textAlign(CENTER);
    font = createFont("silom", 32);
    textFont(font);
    fill(255);
    if (mouseX >= WIDTH/2-overTxtWidth/2 && mouseX <= WIDTH/2+overTxtWidth/2 
        && mouseY >= HEIGHT/2-overTxtHeight/2 && mouseY <= HEIGHT/2+overTxtHeight/2)
      fill(22, 50, 76);
    text("Game over", WIDTH/2, HEIGHT/2);
  }//gameover
  
  void mousePress() {
    if (gameState == 2 && mouseButton == LEFT && mouseX >= WIDTH/2-startTxtWidth/2 && mouseX <= WIDTH/2+startTxtWidth/2 
        && mouseY >= height/2-startTxtHeight/2 && mouseY <= HEIGHT/2+startTxtHeight/2)
      gameState = 3;
    if (gameState == 4 && mouseButton == LEFT && mouseX >= WIDTH/2-startTxtWidth/2 && mouseX <= WIDTH/2+startTxtWidth/2 
        && mouseY >= HEIGHT/2-startTxtHeight/2 && mouseY <= HEIGHT/2+startTxtHeight/2)
      gameState = 1;//start again
    if (gameState == 2 && mouseButton == LEFT && mouseX >= brField.borderDist+brField.borderWidth+50-startTxtWidth/2
        && mouseX <= brField.borderDist+brField.borderWidth+50+startTxtWidth/2  
        && mouseY >= HEIGHT-brField.borderDist+brField.borderWidth-30-startTxtHeight/2 
        && mouseY <= HEIGHT-brField.borderDist+brField.borderWidth-30+startTxtHeight/2) 
      engineState = 0;
  }//mousePressed
  
}//BrMenu
