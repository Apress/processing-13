/*------------------------------------------------------------
Copyright (c) 2013, friends of Ed (An Apress Company)
All rights reserved.

The code provided here accompanies the book:

Processing: Creative Coding and Generative Art in Processing 2
By Ira Greenberg, Dianna Xu, and Deepak Kumar
friends of Ed (An APress Company), 2013
ISBN-13 978-1430244646
Please refer to the associated README for a full disclaimer.
------------------------------------------------------------*/
//grayScale2DArray.pde, chapter 9
//2D arrray of values visualized as grayscale colors

void setup() {
  int[][] array2D = {{84, 208, 73, 105, 11, 54, 212, 93, 4, 157},
                     {15, 155, 57, 75, 3, 157, 93, 118, 11, 77},
                     {227, 75, 143, 23, 192, 218, 87, 15, 13, 72},
                     {68, 228, 74, 70, 78, 225, 191, 121, 232, 190},
                     {162, 22, 119, 255, 179, 45, 166, 96, 135, 200},
                     {114, 196, 234, 80, 232, 100, 183, 165, 203, 23},
                     {178, 65, 130, 3, 71, 179, 44, 31, 44, 183},
                     {18, 34, 153, 96, 231, 92, 240, 204, 157, 0}};
  int cellsize = 40;
  int rows = array2D.length;
  int cols = array2D[0].length;
  size(cellsize*cols+1, cellsize*rows+1);
  
  //uncomment each of the code blocks below to see the effects
  /*  
  array2D[4][3] = 0;
  */
  /*
  for (int i=0; i<array2D.length; i++) {
    array2D[i][5] = 255;
  }
  */
  /*
  for (int j=0; j<array2D[6].length; j++) {
    array2D[6][j] = 255;
  }
  */

  for (int i=0; i<rows; i++) {
    for (int j=0; j<cols; j++) {
      fill(array2D[i][j]);
      pushMatrix();
      translate(j*cellsize, i*cellsize);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
} // end setup()


