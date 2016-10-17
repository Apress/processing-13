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
// quadraticVertex_form_page.pde, chapter 4
// Examples of randomized, closed quadratic curves.

void setup() {
  size(800, 800);
  background(0);
  int cols = 5;
  int rows = 5;
  float formWidth = width/cols;
  float formRadius = formWidth/2;
  float formRadiusMin = 25;
  fill(255);
  for (int i=0; i<rows; i++) {
    for (int j=0; j<cols; j++) {
      pushMatrix();
      translate(formRadius+formWidth*j, formRadius+formWidth*i);
      quadForm(int(random(3, 25)), random(formRadiusMin, formRadius), random(formRadiusMin, formRadius));
      popMatrix();
    }
  }
}

void quadForm(int limbs, float controlRadius, float limbRadius) {
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
    }
    theta += rot;

    // close form
    if (i == limbs-1) {
      cx = cos(0)*controlRadius;
      cy = sin(0)*controlRadius;
      ax = cos(rot)*limbRadius;
      ay = sin(rot)*limbRadius;
      quadraticVertex(cx, cy, ax, ay);
    }
  }
  endShape();
}

