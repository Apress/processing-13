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
// curveEllipse.pde, chapter 4
// Closed curve ellipse.
// Utlilizes cubic curve implementation
// of Catmull-Rom spline.
// 4 vertices and tightness

void setup() {
  size(600, 600);
  background(255);
  translate(width/2, height/2);
  curveEllipse(4, 250, 4, -.675);
}

void curveEllipse(int pts, float radius, float handleRadius, float tightness) {
  float theta = 0;
  float cx = 0, cy = 0;
  float ax = 0, ay = 0;
  float rot = TWO_PI/pts;

  curveTightness(tightness);
  beginShape();
  for (int i=0; i<pts; i++) {
    
    // need control before vertex 1 along the ellipse
    if (i==0) {
      cx = cos(theta - rot)*radius;
      cy = sin(theta - rot)*radius;
      ax = cos(theta)*radius;
      ay = sin(theta)*radius;
      curveVertex(cx, cy);
      curveVertex(ax, ay);
    } 
    else {
      ax = cos(theta)*radius;
      ay = sin(theta)*radius;
      curveVertex(ax, ay);
    }
    // close ellipse
    if (i==pts-1) {
      cx = cos(theta + rot)*radius;
      cy = sin(theta + rot)*radius;
      ax = cos(theta + rot*2)*radius;
      ay = sin(theta + rot*2)*radius;
      curveVertex(cx, cy);
      curveVertex(ax, ay);
    }

    // draw anchor points/control points
    fill(255, 127, 0);
    ellipse(cos(theta)*radius, sin(theta)*radius, handleRadius*2, handleRadius*2);

    theta += rot;
  }
  fill(0, 127);
  noStroke();
  endShape();
} // end curveEllipse

