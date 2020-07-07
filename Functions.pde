//Author: Yke Rusticus
//Date: October 2018

boolean inArray1D (int[] array, int element) {
  int i;
  for (i = 0; i < array.length; i++)
    if (array[i] == element)
      return true;
  return false;
}//inArray1D

boolean inArray2D (int[][] array, int elementX, int elementY) {
  int i;
  for (i = 0; i < array.length; i++) 
    if (array[i][0] == elementX && array[i][1] == elementY)
      return true;
  return false; 
}//inArray2D
