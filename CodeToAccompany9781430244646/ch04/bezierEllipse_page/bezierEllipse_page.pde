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
// bezierEllipse_page.pde, chapter 4
// Examples of randomized, closed Bezier curves.

void setup() {
  size(800, 800);
  background(0);
  int cols = 10;
  int rows = 10;
  float formWidth = width/cols;
  float formRadius = formWidth/2;
  fill(255);
  for (int i=0; i<rows; i++) {
    for (int j=0; j<cols; j++) {
      pushMatrix();
      translate(formRadius+formWidth*j, formRadius+formWidth*i);
       bezierEllipse(int(random(3, 25)), random(-formWidth/2, formRadius), random(-formWidth/2, formRadius));
      popMatrix();
    }
  }
}

void bezierEllipse(int pts, float radius, float controlRadius) {
  //float theta = 0;
  beginShape();
  float cx1 = 0;
  float cy1 = 0;
  float cx2 = 0;
  float cy2 = 0;
  float ax = 0;
  float ay = 0;
  float rot = TWO_PI/pts;
  float theta = 0;
  float controlTheta1 = rot/3.0;
  float controlTheta2 = controlTheta1*2.0;
  // float controlRadius = radius/cos(controlTheta1); randomized now


  for (int i=0; i<pts; i++) {
    cx1 = cos(theta + controlTheta1)*controlRadius;
    cy1 = sin(theta + controlTheta1)*controlRadius;
    cx2 = cos(theta + controlTheta2)*controlRadius;
    cy2 = sin(theta + controlTheta2)*controlRadius;
    ax = cos(theta+rot)*radius;
    ay = sin(theta+rot)*radius;

    if (i==0) {
      // initial vertex required for bezierVertex()
      vertex(cos(0)*radius, sin(0)*radius);
    } 
    // close ellipse
    if (i==pts-1) {
      bezierVertex(cx1, cy1, cx2, cy2, cos(0)*radius, 
      sin(0)*radius);
    }
    // ellipse body
    else {
      bezierVertex(cx1, cy1, cx2, cy2, ax, ay);
    }
    
   /*
   // Use cx2, cy2 of current vertex and cx1, cy1 of next vertex 
    // to draw handles between anchor and controls
    float cx1Next = cos(theta + controlTheta1+rot)*controlRadius;
    float cy1Next = sin(theta + controlTheta1+rot)*controlRadius;
    line(ax, ay, cx1Next, cy1Next);
    line(ax, ay, cx2, cy2);
    
    // draw control and anchor points
    fill(0, 0, 255);
    rect(cx1-3, cy1-3, 6, 6);
    fill(0, 255, 255);
    rect(cx2-3, cy2-3, 6, 6);
    fill(255, 127, 0);
    ellipse(ax, ay, 6, 6);
    */
    
    theta += rot;
  }
  stroke(255);
  noFill();
  endShape();
} // end bezierEllipse

