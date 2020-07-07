//Author: Yke Rusticus
//Date: October 2018

int WIDTH = 800;      //width window (>300)
int HEIGHT = 800;     //height window (>200)

PFont font;           //for text on screen

int engineState;      //defines game
int gameState;        //defines in-game state

GameMenu menu = new GameMenu();
boolean keyInput, keyReleased, mouseInput;

void setup() {
  surface.setSize(WIDTH, HEIGHT);
  engineState = 0;
  gameState = 1;
  keyInput = false;
  mouseInput = false;
}//setup

void draw() {
  if (engineState == 0)
    menu.drawMenu();
  else if (engineState == 1)
    playSnake();
  else if (engineState == 2)
    playBreakout();
}//draw

void keyPressed() {
  keyInput = true;  
}//keyPressed

void keyReleased() {
  keyReleased = true;
}//keyReleased

void mousePressed() {
  if (engineState != 0)
    mouseInput = true;
  else {
    gameState = 1;
    if (mouseX >= menu.relX-menu.SnWidth && mouseX <= menu.relX+menu.SnWidth 
        && mouseY >= menu.SnY-menu.txtUp && mouseY <= menu.SnY+menu.txtDown)
      engineState = 1;
    else if (mouseX >= menu.relX-menu.BrWidth && mouseX <= menu.relX+menu.BrWidth 
        && mouseY >= menu.BrY-menu.txtUp && mouseY <= menu.BrY+menu.txtDown)
      engineState = 2;
    else if (mouseX >= menu.relX-menu.QtWidth && mouseX <= menu.relX+menu.QtWidth 
        && mouseY >= menu.QtY-menu.txtUp && mouseY <= menu.QtY+menu.txtDown)
      exit();
  }
}//mousePressed
