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
// randomized_quadrangle_plot.pde, chapter 3
// Using Processing's drawing functions with 
// randomization. 

// randomized Quadrangle plot
void setup() {
  size(600, 600);
  background(255);
  plotRandomizedQuad (200, 200, 200, 200, .2, .2);
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

