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
// default_ortho_versus_perspective.pde, chapter 11
// Example showcasing ortho and perspective projections.

void setup() {
  size(800, 400, P3D);
  noFill();
  strokeWeight(2);
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/4, height/2, -40);
  rotateY(frameCount*PI/360.0);
  rotateX(frameCount*PI/720.0);
  perspective();
  box(200);
  popMatrix();

  translate(width-width/4, height/2);
  rotateY(frameCount*PI/360.0);
  rotateX(frameCount*PI/720.0);
  ortho();
  box(200);
}

