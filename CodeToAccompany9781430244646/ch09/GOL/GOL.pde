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
// GOL.pde, chapter 9
// Conway's Game of Life implemented on a 50x50 grid

// Flags and game parameters
int N = 50;               // Grid Dimension
int cellSize = 10;        // Size of cell
int cur = 0;              // Current grid index
int nxt = 1;              // next grid index

// CA consists of two grids for current and next step
boolean[][][] CA = new boolean[N][N][2];

void setup() {
  size(500, 500);
  randomizeGrid(cur);
} // end setup()

void draw() {
  background(255);
  drawCells();
  advanceGame();
} // end draw()

void advanceGame() {
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      // Count location neighbors
      int neighbors = countNeighbors(i, j);

      // If the cell is alive ...
      if (CA[i][j][cur] == true) {
        if (neighbors < 2 || neighbors > 3) {
          CA[i][j][nxt] = false;
        } 
        else {
          CA[i][j][nxt] = true;
        } 
      } 
      else {
        if (neighbors == 3) {
          CA[i][j][nxt] = true;
        } 
        else {
          CA[i][j][nxt] = false;
        }
      }
    }
  }

  // Swap grid indices
  int tmp = cur;
  cur = nxt;
  nxt = tmp;
} // end advanceGame()

// Count the number of live neighbors of current cell
int countNeighbors(int i, int j) {
  int count = 0;
  for (int ii=i-1; ii<=i+1; ii++) {
    for (int jj=j-1; jj<=j+1; jj++) {
      // Wrap edges of board
      int iii = (ii + N) % N;
      int jjj = (jj + N) % N;

      // Skip center location
      if (iii!=i || jjj!=j)
        if ( CA[iii][jjj][cur] == true )
          count++;
    }
  }
  return count;
} // end countNeighbors()

void drawCells() {
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      if (CA[i][j][cur] == true) {
        fill(0);
        noStroke();
      }
      else {
        fill(255);
        stroke(240);
      }
      rect(i*cellSize, j*cellSize, cellSize, cellSize);
    }
  }
} // end drawCells()

// Randomly set 20% of cells alive
void randomizeGrid(int c) {
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      // set 20% of cells alive
      if (random(0, 1) < .2) {
        CA[i][j][c] = true;
      }
    }
  }
} // end randomizeGrid()


