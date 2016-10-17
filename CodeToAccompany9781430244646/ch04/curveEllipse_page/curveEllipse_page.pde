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
// curveEllipse_page.pde, chapter 4
// Examples of closed spline curves.

void setup() {
  size(800, 800);
  background(0);
  int cols = 10;
  int rows = 10;
  float formWidth = width/cols;
  float formRadius = formWidth/2;
  noFill();
  stroke(255);
  for (int i=0; i<rows; i++) {
    for (int j=0; j<cols; j++) {
      pushMatrix();
      translate(formRadius+formWidth*j, formRadius+formWidth*i);
      curveEllipse(int(random(3, 25)), random(formRadius*.25, formRadius), random(-30, 30));
      popMatrix();
    }
  }
}

void curveEllipse(int pts, float radius, float tightness) {
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
    //fill(255, 127, 0);
    //ellipse(cos(theta)*radius, sin(theta)*radius, handleRadius*2, handleRadius*2);

    theta += rot;
  }
  endShape();
} // end curveEllipse

