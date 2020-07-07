//Author: Yke Rusticus
//Date: October 2018

class SnApple {
  
  int appleX, appleY;     //apple coords
  int i;                  //for loop
  boolean apple = false;  //apple in field
  boolean appleOnSnake;   //apple on snake
  
  void getAppleStatus() {
    if (snake.pos[snake.snLength*2-2] == appleX && snake.pos[snake.snLength*2-1] == appleY) {
      snake.toGrow += snake.growth;
      apple = false;
    }
  }//getAppleStatus
  
  void getApplePos(){
    appleOnSnake = true;
    while (appleOnSnake) {
      appleOnSnake = false;
      appleX = int(random((snField.borderDist+snField.borderWidth)/10,(WIDTH-snField.borderDist-snField.borderWidth)/10)) * snake.thickness;
      appleY = int(random((snField.borderDist+snField.borderWidth)/10,(HEIGHT-snField.borderDist-snField.borderWidth)/10)) * snake.thickness;
      for (i = 0; i < snake.snLength; i++)
        if (snake.pos[i*2] == appleX && snake.pos[i*2+1] == appleY)
          appleOnSnake = true;
    }
    apple = true;
  }//getApplePos
  
  void drawApple() {
    if (!apple)
      getApplePos();
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rect(appleX, appleY, appleX+snake.thickness, appleY+snake.thickness);  
  }//drawApple
  
}//SnApple
