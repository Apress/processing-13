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
// randomized_quadrangle_plot_page.pde, chapter 3
// Generates a table structure of random quadrangles.

// jitter form 0-.5
void setup() {
  size(800, 800);
  background(255);
  int cols = 8;
  int rows = 8;
  float gap = 30;
  float cellW = (width - gap*(cols+1))/cols; // account for gaps on edges and between quads.
  float cellH = (height - gap*(rows+1))/rows; // account for gaps on edges and between quads.
  float jitterFactor = .5/64; //show jitter form 0-.5
  fill(0);
  for (int i=0; i<rows; i++) {
    for (int j=0; j<cols; j++) {
      int totalCounter = i*cols+j;
      plotRandomizedQuad (gap + cellW*j + gap*j, gap + cellH*i + gap*i, cellW, cellH, 
            jitterFactor*totalCounter, jitterFactor*totalCounter);
    }
  }
} // end setup

void plotRandomizedQuad(float x, float y, float w, float h, float randW, float randH) {
  float jitterW = w*randW;
  float jitterH = h*randH;
  beginShape();
  vertex(x+random(-jitterW, jitterW), y+random(-jitterH, jitterH));
  vertex(x+random(-jitterW, jitterW), y+h+random(-jitterH, jitterH));
  vertex(x+w+random(-jitterW, jitterW), y+h+random(-jitterH, jitterH));
  vertex(x+w+random(-jitterW, jitterW), y+random(-jitterH, jitterH));
  endShape(CLOSE);
} // end plotRandomizedQuad

