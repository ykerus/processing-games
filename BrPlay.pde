//Author: Yke Rusticus
//Date: October 2018

BrField brField;
BrMenu brMenu;
BrBouncer bouncer;
BrBall ball;
BrLevel1 level;

void playBreakout() {

  if (keyPressed) {
    keyInput = false;
  }
  if (mouseInput) {
    brMenu.mousePress();
    mouseInput = false;
  }
  switch(gameState) {
    //INITIALISATION
    case 1: brField = new BrField();
            brMenu = new BrMenu();
            bouncer = new BrBouncer();
            ball = new BrBall();
            level = new BrLevel1();
            gameState = 2;
            break;
    //STARTMENU
    case 2: brField.drawField();
            bouncer.drawBouncer();
            brMenu.drawMenu();
            ball.drawBall();
            break;           
    //PLAY
    case 3: noCursor();
            brField.drawField();
            bouncer.drawBouncer();
            ball.drawBall();
            level.drawLevel();
            break;
    //GAMEOVER
    case 4: cursor(ARROW);
            brField.drawField(); 
            bouncer.drawBouncer();
            ball.drawBall();
            level.drawLevel();
            brMenu.drawGameOver();
            break;
      
  }
}//playBreakout
