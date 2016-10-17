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
// truchetRandom.pde, chapter 9
// Truchet tiling with random orientation

int tileSize = 24;
int rows = 35;
int cols = 35;
Tile[][] tiles = new Tile[rows][cols];

void setup() {
  size(tileSize*rows, tileSize*cols);
  smooth();
  background(255);

  for (int i=0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      tiles[i][j] = new Tile(j*tileSize, i*tileSize, tileSize);
      tiles[i][j].display();
    }
  }
} // end setup()

