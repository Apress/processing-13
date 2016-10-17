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
// quadraticEllipse.pde, chapter 4
// Closed quadratic ellipse.
// 8 vertices

void setup() {
  size(600, 600);
  background(255);
  translate(width/2, height/2);
  quadraticEllipse(8, 250, 4);
}

void quadraticEllipse(int pts, float radius, float handleRadius) {
  float theta = 0;
  float cx = 0, cy = 0; // control points
  float ax = 0, ay = 0; // anchor points
  float rot = TWO_PI/pts;
  float controlRadius = radius/cos(theta-rot/2);

  beginShape();
  for (int i=0; i<pts; i++) {
    cx = cos(theta + rot/2)*controlRadius;
    cy = sin(theta + rot/2)*controlRadius;
    ax = cos(theta + rot)*radius;
    ay = sin(theta + rot)*radius;

    // initial vertex required for quadraticVertex()
    if (i==0) {
      vertex(cos(theta)*radius, sin(theta)*radius);
    }
    
    // draw quadratic curve segments
    quadraticVertex(cx, cy, ax, ay);

    // draw control and anchor points
    fill(0, 0, 255);
    rect(cx-handleRadius, cy-handleRadius, handleRadius*2, handleRadius*2);
    fill(0, 255, 255);
    fill(255, 127, 0);
    ellipse(ax, ay, handleRadius*2, handleRadius*2);

    // draw handles between anchor and left and right control pts
    float cxNext = cos(theta + rot + rot/2)*controlRadius;
    float cyNext = sin(theta + rot + rot/2)*controlRadius;
    line(ax, ay, cx, cy);
    line(ax, ay, cxNext, cyNext);

    theta += rot;
  }
  noStroke();
  fill(0, 127);
  endShape();
} // end quadraticEllipse

