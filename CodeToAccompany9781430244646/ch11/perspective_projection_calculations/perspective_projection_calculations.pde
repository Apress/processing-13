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
// perspective_projection_calculations.pde, chapter 11
// Calculating perspective projection example.

PVector[] vecs = new PVector[8];
void setup() {
  size(500, 500);
  background(255);
  strokeWeight(20);
  float d = -10;
  float theta = -PI/4;
  float r = 400;
  float z, zNear = -20, zFar = -50; //z pos of cube front pts
  z = zNear;
  for (int i=0; i<vecs.length; i++) {
    vecs[i] = new PVector(cos(theta)*r, sin(theta)*r, z);
    theta += TWO_PI/4;
    if (i==3) {
      z = zFar; // set z pos of cube back pts
      theta = -PI/4;
    }
  }
  translate(width/2, height/2);
  beginShape(POINTS);
  for (int i=0; i<vecs.length; i++) {
    float x = vecs[i].x*(d/vecs[i].z);
    float y = vecs[i].y*(d/vecs[i].z);
    vertex(x, y);
  }
  endShape();
}

