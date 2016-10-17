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
// default_perspective_projection.pde, chapter 11
// Default perspective projection example.

void setup() {
  size(400, 400, P3D);
  noFill();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  rotateY(frameCount*PI/360.0);
  rotateX(frameCount*PI/720.0);
  box(200);
}

