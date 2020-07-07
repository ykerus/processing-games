//Author: Yke Rusticus
//Date: October 2018

class SnMenu {
   
  int mnHeight;   //menu height
  int mnWidth;    //menu width
  int count;      //for countdown
  int i;          //for countdown
  
  SnMenu() {
    mnHeight = 100;
    mnWidth = 200;
    count = 3;
    i = count;
  }//SnMenu
  
  void drawMenu() {
    font = createFont("silom", 32);
    textAlign(CENTER);
    textFont(font);
    fill(255);
    if (mouseX >= WIDTH/2-mnWidth/2 && mouseX <= WIDTH/2+mnWidth/2 
        && mouseY >= HEIGHT/2-mnHeight/2 && mouseY <= HEIGHT/2+mnHeight/2)
      fill(22, 50, 76);
    text("Start game", WIDTH/2, HEIGHT/2);
    font = createFont("silom", 25);
    textFont(font);
    fill(255);
    if (mouseX >= snField.borderDist+snField.borderWidth+50-mnWidth/2 
        && mouseX <= snField.borderDist+snField.borderWidth+50+mnWidth/2 
        && mouseY >= HEIGHT-snField.borderDist+snField.borderWidth-30-mnHeight/2 
        && mouseY <= HEIGHT-snField.borderDist+snField.borderWidth-30+mnHeight/2)
      fill(22, 50, 76);
    text("Back", snField.borderDist+snField.borderWidth+50, 
          HEIGHT-snField.borderDist+snField.borderWidth-40);
  }//drawMenu
  
  void drawCountDown() {
    if (i > 0) {  
      textAlign(CENTER);
      font = createFont("silom", 32);
      textFont(font);
      fill(255);
      text(str(i), WIDTH/2, HEIGHT/2);
      i--;
    }
    else 
      gameState = 4;
    if (i < count-1)
      delay(700);
  }//drawCountDown
  
  void drawScore() {
    textAlign(CENTER);
    font = createFont("silom", 20);
    textFont(font);
    fill(255);
    text("LENGTH: "+str(snake.snLength), WIDTH/6, snField.borderDist/1.3);
    text("BEST: "+str(snakeBest), WIDTH/6*5, snField.borderDist/1.3);
  }//drawScore
    
  void drawGameOver() {
    textAlign(CENTER);
    font = createFont("silom", 32);
    textFont(font);
    fill(255);
    if (mouseX >= WIDTH/2-mnWidth/2 && mouseX <= WIDTH/2+mnWidth/2 
        && mouseY >= HEIGHT/2-mnHeight/2 && mouseY <= HEIGHT/2+mnHeight/2)
      fill(22, 50, 76);
    text("Game over", WIDTH/2, HEIGHT/2);
  }//gameover
  
  void mousePress() {
    if (gameState == 2 && mouseButton == LEFT && mouseX >= WIDTH/2-mnWidth/2 && mouseX <= WIDTH/2+mnWidth/2 
        && mouseY >= height/2-mnHeight/2 && mouseY <= HEIGHT/2+mnHeight/2)
      gameState = 3;
    if (gameState == 5 && mouseButton == LEFT && mouseX >= WIDTH/2-mnWidth/2 && mouseX <= WIDTH/2+mnWidth/2 
        && mouseY >= HEIGHT/2-mnHeight/2 && mouseY <= HEIGHT/2+mnHeight/2)
      gameState = 1;//start again
    if (gameState == 2 && mouseButton == LEFT && mouseX >= snField.borderDist+snField.borderWidth+50-mnWidth/2
        && mouseX <= snField.borderDist+snField.borderWidth+50+mnWidth/2  
        && mouseY >= HEIGHT-snField.borderDist+snField.borderWidth-30-mnHeight/2 
        && mouseY <= HEIGHT-snField.borderDist+snField.borderWidth-30+mnHeight/2) 
      engineState = 0;
  }//mousePressed  
  
}//SnMenu
