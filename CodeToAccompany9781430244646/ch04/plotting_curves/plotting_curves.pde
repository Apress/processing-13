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
// plotting_curves.pde, chapter 4
// Quadratic and cubic curve plot example.

void setup() {
  size(600, 600);
  background(255);
  noFill();
  strokeWeight(4);
  translate(width/2, 0);

  // draw quadratic curve
  float fx2Max = fx2(width/2);
  float fx2Scale = height/fx2Max;

   stroke(0, 0, 255);
   beginShape();
  for (int i=-width/2; i<width/2; i++) {
    vertex(i, fx2(i)*fx2Scale);
  }
  endShape();

  // draw cubic curve
  stroke(255, 127, 0);
  float fx3Max = fx3(width/2);
  float fx3Scale = height/(fx3Max*2);

  beginShape();
  for (int i=-width/2; i<width/2; i++) {
    vertex(i, height/2+fx3(i)*fx3Scale);
  }
  endShape();
}

// quadratic
float fx2(float x) {
  return x*x;
}

// cubic
float fx3(float x) {
  return x*x*x;
}

