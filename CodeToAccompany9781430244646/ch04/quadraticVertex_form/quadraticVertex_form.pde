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
// quadraticVertex_form.pde, chapter 4
// Closed and randomized quadratic curve.

void setup() {
  size(800, 800);
  background(255);
  translate(width/2, height/2);
  quadraticForm(int(random(3, 25)), random(50, 375), random(50, 375));
}

void quadraticForm(int limbs, float controlRadius, float limbRadius) {
  float theta = 0;
  beginShape();
  float cx = 0;
  float cy = 0;
  float ax = 0;
  float ay = 0;
  float rot = TWO_PI/(limbs*2);
  for (int i=0; i<limbs; i++) {
    cx = cos(theta)*controlRadius;
    cy = sin(theta)*controlRadius;
    theta += rot;
    ax = cos(theta)*limbRadius;
    ay = sin(theta)*limbRadius;
    if (i==0) {
      // initial vertex required for quadraticVertex()
      vertex(ax, ay);
    } 
    else {
      quadraticVertex(cx, cy, ax, ay);
      // draws vertices and controls
      fill(0, 0, 255);
      rect(cx-3, cy-3, 6, 6);
      ellipse(ax, ay, 6, 6);
      line(ax, ay, cx, cy);
    }
    theta += rot;

    // close form
    if (i == limbs-1) {
      cx = cos(0)*controlRadius;
      cy = sin(0)*controlRadius;
      ax = cos(rot)*limbRadius;
      ay = sin(rot)*limbRadius;
      quadraticVertex(cx, cy, ax, ay);

      // draws vertex and control
      rect(cx-3, cy-3, 6, 6);
      ellipse(ax, ay, 6, 6);
      line(ax, ay, cx, cy);
    }
  }
  fill(0);
  endShape();
}

