//Author: Yke Rusticus
//Date: October 2018

class SnSnake {
  
  int thickness;                 //snake thickness
  int growth;                    //growth per apple
  int snLength;                  //snake length
  int toGrow = 0;                //amount snake has to grow
  int i;                         //for loops
  int[] pos;                     //positions of the snake body
  boolean dead = false;          //end game if true
  boolean keyWasPressed = false; //false: move forward
  String prevKey = "RIGHT";      //previous pressed key
  
  SnSnake() {
    thickness = 10;
    growth = 10;
    snLength = 5;    
    pos = new int[WIDTH*HEIGHT*2/thickness];
    for (i = 0; i < snLength; i++) {
      pos[i*2] = snField.borderDist + snField.borderWidth + (i+2)*thickness;
      pos[i*2+1] = snField.borderDist + snField.borderWidth + 3*thickness;
    }
  }//SnSnake
  
  void getLifeStatus() {
    for (i = 0; i < snLength-1; i++)
      if (pos[i*2] == pos[snLength*2-2] && pos[i*2+1] == pos[snLength*2-1])
        dead = true; 
    if ((pos[snLength*2-2] < snField.borderDist+snField.borderWidth) 
        || (pos[snLength*2-2] >= WIDTH-snField.borderDist-snField.borderWidth)
        || (pos[snLength*2-1] < snField.borderDist+snField.borderWidth) 
        || (pos[snLength*2-1] >= HEIGHT-snField.borderDist-snField.borderWidth))
      dead = true;
  }//getLifeStatus

  void growSnake() {
    for (i = snLength; i > 0; i--){
      pos[i*2+1] = pos[i*2-1];
      pos[i*2] = pos[i*2-2];
    }
    pos[0] = pos[2];
    pos[1] = pos[3];
    toGrow--;
    snLength++;
  }//growSnake
  
  void moveForward() {
    pos[snLength*2] = pos[snLength*2-2] + (pos[snLength*2-2]-pos[snLength*2-4]);
    pos[snLength*2+1] = pos[snLength*2-1]+ (pos[snLength*2-1]-pos[snLength*2-3]);
    for (i = 0; i < snLength; i++) {
      pos[i*2] = pos[i*2+2];
      pos[i*2+1] = pos[i*2+3];
    }
  }//moveForward
  
  void drawSnake() {
    rectMode(CORNERS);
    fill(109, 223, 117);
    stroke(40, 91, 25);
    for (i = 0; i < snLength; i++) 
      rect(pos[i*2], pos[i*2+1], pos[i*2]+thickness, pos[i*2+1]+thickness);
    if (dead) {
      fill(255, 255, 255);
      stroke(40, 91, 25);
      rect(pos[snLength*2-2], pos[snLength*2-1], pos[snLength*2-2]+thickness, pos[snLength*2-1]+thickness);
    }
  }//drawSnake
  
  void keyPress() {
    if (!dead && ((keyCode == RIGHT && prevKey != "LEFT") || (keyCode == LEFT && prevKey != "RIGHT")
    || (keyCode == UP && prevKey != "DOWN") || (keyCode == DOWN && prevKey != "UP"))) {
      keyWasPressed = true;
      if (keyCode == RIGHT && prevKey != "LEFT") {
        pos[snLength*2] = pos[snLength*2-2] + thickness;
        pos[snLength*2+1] = pos[snLength*2-1];
        prevKey = "RIGHT";
      }
      if (keyCode == LEFT && prevKey != "RIGHT") {
        pos[snLength*2] = pos[snLength*2-2] - thickness;
        pos[snLength*2+1] = pos[snLength*2-1];
        prevKey = "LEFT";
      }
      if (keyCode == UP && prevKey != "DOWN") {
        pos[snLength*2] = pos[snLength*2-2];
        pos[snLength*2+1] = pos[snLength*2-1] - thickness;
        prevKey = "UP";
      }
      if (keyCode == DOWN && prevKey != "UP") {
        pos[snLength*2] = pos[snLength*2-2];
        pos[snLength*2+1] = pos[snLength*2-1] + thickness;
        prevKey = "DOWN";
      }
      for (i = 0; i < snLength; i++) {
        pos[i*2] = pos[i*2+2];
        pos[i*2+1] = pos[i*2+3];
      }
    }
  }//keyPress 
  
}//SnSnake
