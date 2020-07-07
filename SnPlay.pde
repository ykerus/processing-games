//Author: Yke Rusticus
//Date: October 2018

SnField snField;
SnMenu snMenu;
SnSnake snake;
SnApple apple;

int snakeDifficulty = 5;  //1=easy ... 10=hard
int snakeBest = 0;        //high score

void playSnake() {
  
  if (keyInput) {
    snake.keyPress();
    keyInput = false;
  }
  if (mouseInput) {
    snMenu.mousePress();
    mouseInput = false;
  }
  switch (gameState) {
    //INITIALISATION
    case 1: if (snake != null && snake.snLength > snakeBest)
              snakeBest = snake.snLength;
            snField = new SnField();
            snake = new SnSnake();
            apple = new SnApple();
            snMenu = new SnMenu();
            gameState = 2;
            break;
    //STARTMENU
    case 2: snField.drawField(); 
            snMenu.drawScore();
            snake.drawSnake();
            snMenu.drawMenu();
            break;
    //COUNTDOWN
    case 3: snField.drawField();    
            snMenu.drawScore();
            snake.drawSnake();
            snMenu.drawCountDown();
            break;
    //PLAY
    case 4: if (!snake.keyWasPressed && !snake.dead)
              snake.moveForward();
            snake.getLifeStatus();
            if (snake.dead)
              gameState = 5;
            if (snake.toGrow > 0 && !snake.dead) 
              snake.growSnake();
            apple.getAppleStatus();
            snField.drawField(); 
            snMenu.drawScore();
            apple.drawApple();
            snake.drawSnake();
            snake.keyWasPressed = false;
            delay(100/snakeDifficulty);
            break;
    //GAMEOVER
    case 5: snField.drawField(); 
            snMenu.drawScore();
            snake.drawSnake();
            snMenu.drawGameOver();
            break;
    }    
}//PlaySnake
