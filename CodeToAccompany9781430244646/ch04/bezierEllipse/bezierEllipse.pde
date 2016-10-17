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
// bezierEllipse.pde, chapter 4
// Closed Bezier curve.


void setup() {
  size(600, 600);
  background(255);
  translate(width/2, height/2);
  bezierEllipse(4, 250, 4);
}

void bezierEllipse(int pts, float radius, float handleRadius) {
  float theta = 0;
  float cx1 = 0, cy1 = 0;
  float cx2 = 0, cy2 = 0;
  float ax = 0, ay = 0;
  float rot = TWO_PI/pts;
  float controlTheta1 = rot/3.0;
  float controlTheta2 = controlTheta1*2.0;
  float controlRadius = radius/cos(controlTheta1);

  beginShape();
  for (int i=0; i<pts; i++) {
    cx1 = cos(theta + controlTheta1)*controlRadius;
    cy1 = sin(theta + controlTheta1)*controlRadius;
    cx2 = cos(theta + controlTheta2)*controlRadius;
    cy2 = sin(theta + controlTheta2)*controlRadius;
    ax = cos(theta + rot)*radius;
    ay = sin(theta + rot)*radius;

    if (i==0) {
      // initial vertex required for bezierVertex()
      vertex(cos(theta)*radius, sin(theta)*radius);
    } 
    
    // draw bezier curve segments
    bezierVertex(cx1, cy1, cx2, cy2, ax, ay);

    // Use cx2, cy2 of current vertex and cx1, cy1 of next vertex 
    // to draw handles between anchor and controls
    float cx1Next = cos(theta + controlTheta1 + rot)*controlRadius;
    float cy1Next = sin(theta + controlTheta1 + rot)*controlRadius;
    line(ax, ay, cx1Next, cy1Next);
    line(ax, ay, cx2, cy2);

    // draw control and anchor points
    fill(0, 0, 255);
    rect(cx1-handleRadius, cy1-handleRadius, handleRadius*2, handleRadius*2);
    fill(0, 255, 255);
    rect(cx2-handleRadius, cy2-handleRadius, handleRadius*2, handleRadius*2);
    fill(255, 127, 0);
    ellipse(ax, ay, handleRadius*2, handleRadius*2);

    theta += rot;
  }
  fill(0, 127);
  noStroke();
  endShape();
} // end bezierEllipse

