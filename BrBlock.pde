//Author: Yke Rusticus
//Date: October 2018

class BrBlock {
  
  int blockLength;            //length of the block
  int blockWidth;             //width/thickness
  int x, y;                   //coords top left corner
  int[] blockRGB;                    //color
  boolean destroyed = false;  //status of block
  
  BrBlock(int blockX, int blockY, int[] blockColor) {
    blockLength = 60;
    blockWidth = 20;
    x = blockX;
    y = blockY;
    blockRGB = blockColor;
  }//BrBlock
  
  void drawBlock() {
    rectMode(CORNERS);
    fill(blockRGB[0], blockRGB[1], blockRGB[2]);
    stroke(0);
    rect(x, y, x+blockLength, y+blockWidth);
  }//drawBlock
  
}//BrBlock
