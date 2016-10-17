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
// rotating_square.pde, chapter 4
// Combining animation and transformations

// declare global variables
// for moving square
float x, y, w;
float spdX, spdY, theta, rotSpd;

void setup() {
  size(600, 600);
  // initialize global variables
  x = width/2;
  y = height/2;
  w = 150;
  spdX = 2.1;
  spdY = 1.5;
  rotSpd = PI/180;
  fill(0, 175, 175);
  noStroke();
}

void draw() {
  background(255, 127, 0);
  pushMatrix();
  translate(x, y);
  rotate(theta);
  rect(-w/2, -w/2, w, w);
  popMatrix();
  x += spdX;
  y += spdY;
  theta += rotSpd;
}
