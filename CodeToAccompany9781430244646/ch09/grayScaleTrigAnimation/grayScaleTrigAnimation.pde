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
// grayScaleTrigAnimation.pde, chapter 9
// 2D array with periodic gradient shading visualized with continuous animation

int rows = 100;
int cols = 100;
float[][] grays = new float[rows][cols];
int cellSize = 5;
float[][] incs = new float[rows][cols];

void setup() {
  size(cellSize*cols, cellSize*rows);
  noStroke();
  // uncommment for full color variation
  //colorMode(HSB);

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      float x = map(i, 0, rows-1, 0, 2*PI);
      float y = map(j, 0, cols-1, 0, 2*PI);
      float z = sin(x)*cos(y);
      grays[i][j] = map(z, -1.0, 1.0, 0.0, 255.0);
      incs[i][j] = 1;
    }
  }
}

void draw() {
  background(255);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      fill(grays[i][j]);
      // full color variation, uncomment colorMode(HSB) above
      //fill(grays[i][j], 255, 255);
      pushMatrix();
      // j is the column index, which correspond to the x  screen coordinate
      translate(j*cellSize, i*cellSize); 
      rect(0, 0, cellSize, cellSize);
      popMatrix();

      if (grays[i][j] > 255 || grays[i][j] < 0)
        incs[i][j] = -incs[i][j];
      grays[i][j] += incs[i][j];
    }
  }
}

