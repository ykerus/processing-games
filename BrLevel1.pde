//Author: Yke Rusticus
//Date: October 2018
//build for size(800x800), borderDist = 30, borderWidth = 10

int[] red = {255, 0, 0};              //0: red
int[] orange = {255, 139, 0};         //1: orange
int[] yellow = {250, 253, 0};         //2: yellow
int[] green = {0, 214, 0};            //3: green
int[] lightblue = {0, 196, 255};      //4: lightblue
int[] blue = {60, 0, 247};            //5: blue
int[] purple = {102, 0, 198};         //6: purple
int[][] rainbow = {red, orange, yellow, green, lightblue, blue, purple};
int colors = 7;

// _________________________________________________
// |100|101|102|103|104|105|106|107|108|109|...    |
// |200|201|202|203|204|205|206|207|208|209|...    |
// |300|301|302|303|304|305|306|307|308|309|...    |
// |400|401|402|403|404|405|406|407|408|409|...    |
// |...                                            |
// -------------------------------------------------

class BrLevel1 {
  
  BrBlock block = new BrBlock(0, 0, red);
  int[] blockNumbers;
  BrBlock[] blocks;
  int[][] blockCoords; 
  int i;
  int rows;
  int startRow;
  int blocksPerRow;
  
  BrLevel1() {
    rows = 14;
    startRow = 2;
    blocksPerRow = (WIDTH-2*brField.borderDist-2*brField.borderWidth)/block.blockLength;
    blockNumbers = new int[blocksPerRow*rows];
    blocks = new BrBlock[blockNumbers.length];
    for (i = 0; i < blockNumbers.length; i++) {
      blockNumbers[i] = (i/blocksPerRow+1)*100 + i%blocksPerRow;
      blockNumbers[i] += startRow*100;
      blocks[i] = new BrBlock((blockNumbers[i]%100)*block.blockLength+brField.borderDist+brField.borderWidth, 
                      (blockNumbers[i]/100-1)*block.blockWidth+brField.borderDist+brField.borderWidth, rainbow[(blockNumbers[i]/100-1)%colors]);
    }
  }//BrLevel1
  
  void drawLevel() {
    for (i = 0; i < blockNumbers.length; i++)
      blocks[i].drawBlock();
  }//drawLevel
  
}//BrLevel1
