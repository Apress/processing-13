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
// truchetSwap.pde, chapter 9
// Truchet tiling with swapping to maintain pattern/color continuity

int tileSize = 50;
int rows = 20;
int cols = 20;
Tile[][] tiles = new Tile[rows][cols];
color ic = color(200, 100, 0);    // orange
color oc = color(20, 100, 255);   // blue

void setup() {
  // you should switch to the P2D render if misalignment occurs with the default Java2D
  size(tileSize*rows, tileSize*cols);
  smooth();

  for (int i=0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      tiles[i][j] = new Tile(j*tileSize, i*tileSize, tileSize, ic, oc);
      colorSwap(i, j);
      tiles[i][j].display();
    }
  }
  // uncomment to draw grid
  //grid();
} // end setup()

// takes the row and column indices of the current tile and decides how to set its swapColor boolean variable
void colorSwap(int i, int j) {
  if (i > 0 && j == 0) {                                  // first tile of a row, starting from the 2nd row
    if (tiles[i-1][0].orient == tiles[i][0].orient) {     // same orientation as tile directly above
      tiles[i][0].swapColors = !tiles[i-1][0].swapColors; // set to opposite coloring of my neighbor above
    }
    else {
      tiles[i][0].swapColors = tiles[i-1][0].swapColors;  // set to same coloring of my neighbor above
    }
  }
  if (j > 0) {                                            // subsequent tiles in a row, including the first
    if (tiles[i][j-1].orient == tiles[i][j].orient) {
      tiles[i][j].swapColors = !tiles[i][j-1].swapColors; // set to opposite coloring of my neighbor to the left
    }
    else {
      tiles[i][j].swapColors = tiles[i][j-1].swapColors;  // set to same coloring of my neighbor to the left
    }
  }
}

void grid() {
  stroke(50);
  for (int i=0; i < rows; i++) {
    line(0, i*tileSize, width, i*tileSize);
  }
  for (int j = 0; j < cols; j++) {
    line(j*tileSize, 0, j*tileSize, height);
  }
}

