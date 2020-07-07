//Author: Yke Rusticus
//Date: October 2018

class BrBall {
  
  int r;                  //radius
  int i;                  //for loops
  float x, y;             //ball coords
  float speed;            //ball speed
  float speedX, speedY;   //speed direction
  boolean fallen = false; //game over if true
  
  BrBall() {
    r = 5;
    speed = 10;
    speedX = 3/7. * speed;
    speedY = -(speed - speedX);
    x = bouncer.x + bouncer.brLength/2.;
    y = bouncer.y - 4*r;
  }//BrBall
  
  boolean xBound() {
    return ((x+speedX-r <= brField.borderDist+brField.borderWidth 
       || x+speedX+r >= WIDTH-brField.borderDist-brField.borderWidth)
       || (y >= bouncer.y && y+speedY <= bouncer.y+bouncer.brWidth && ((x < bouncer.x && x+speedX > bouncer.x) 
       || (x > bouncer.x+bouncer.brLength && x+speedX < bouncer.x+bouncer.brLength))));
  }//xBound
  
  boolean yBound() {
    return (y+speedY-r <= brField.borderDist+brField.borderWidth);
  }//yBound
  
  boolean bounce() {
    return (y+speed >= bouncer.y && x+speedX >= bouncer.x 
        && x+speedX <= bouncer.x+bouncer.brLength && y < bouncer.y);
  }
  
  void getBoundaryUpdate() {
    if (xBound())
      speedX = -speedX;
    if (yBound())
      speedY = -speedY;
  }//getBoundaryUpdate
  
  void getBouncerUpdate() {
    if (bounce()) {
      
      speedY = -speedY;
    }
  }//getBouncerUpdate
  
  //void getBouncerUpdate() {
  //  if (bounce()) {
  //    if (x+speedX <= bouncer.x+bouncer.brLength*(5/6.)) 
  //        speedX -= edge;
  //    else if (x+speedX <= bouncer.x+bouncer.brLength/6.*2)
  //        speedX -= semiEdge;
  //    else if (x+speedX <= bouncer.x+bouncer.brLength/6.*4)
  //      speedX -= 0;
  //    else if (x+speedX <= bouncer.x+bouncer.brLength/6.*5)
  //        speedX += semiEdge;
  //    else if (x+speedX <= bouncer.x+bouncer.brLength)
  //        speedX += edge;       
  //    speedY = (speed-abs(speedX));
  //    if (speedY > 0)
  //      speedY = -1*speedY;
  //  }
  //}//getBouncerUpdate
  
  void getBlocksUpdate() {
    for (i = 0; i < level.blocks.length; i++) {
      if (y+speedY >= level.blocks[i].y && y+speedY <= level.blocks[i].y+level.blocks[i].blockWidth 
          && ((x <= level.blocks[i].x && x+speedX > level.blocks[i].x) 
          || (x >= level.blocks[i].x+level.blocks[i].blockLength 
          && x+speedX < level.blocks[i].x+level.blocks[i].blockLength))) {
        speedX = -1*speedX;
        level.blocks[i].x = -100;
        level.blocks[i].y = -100;
      }
      if (x+speedX >= level.blocks[i].x && x+speedX <= level.blocks[i].x+level.blocks[i].blockLength
          && ((y >= level.blocks[i].y+level.blocks[i].blockWidth 
          && y+speedY < level.blocks[i].y+level.blocks[i].blockWidth) 
          || (y <= level.blocks[i].y && y+speedY > level.blocks[i].y))) {
        speedY = -1*speedY;   
        level.blocks[i].x = -100;
        level.blocks[i].y = -100;
      }
    }
  }//getBlockUpdate
  
  void updatePos() {
    getBoundaryUpdate();
    getBouncerUpdate();
    getBlocksUpdate();
    if (y >= bouncer.y+20) {
      speedX = 0;
      speedY = 0;
      fallen = true;
      gameState = 4;
    }
    x += speedX;
    y += speedY;
  }//update
  
  void drawBall() {
    if (gameState == 3)
      updatePos();
    ellipseMode(CENTER);
    fill(255);
    stroke(150);
    if (fallen) {
      fill(255, 0, 0);
      stroke(255, 0, 0);
    }
    ellipse(x, y, r*2, r*2);
  }//drawBall
  
  
}//BrBall
