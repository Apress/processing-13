/*------------------------------------------------------------
Copyright (c) 2013, Friends of Ed (An Apress Company)
All rights reserved.

The code provided here accompanies the book:

Processing: Creative Coding and Generative Art in Processing 2
By Ira Greenberg, Dianna Xu, and Deepak Kumar
Friends of Ed (An APress Company), 2013
ISBN-13 978-1430244646
Please refer to the associated README for a full disclaimer.
------------------------------------------------------------*/
//recursiveTreeTransform.pde, chapter 8
//Recursively draws a tree
//This version uses transformations

void setup() {
  size(800, 800);
  background(255);
  stroke(156, 171, 61);
  translate(width/2, height);
  drawTree(175, -90);
} // end setup()

void drawTree(float len, float angle) {
  if (len > 2) {
    rotate(radians(angle));
    line(0, 0, len, 0);
    translate(len, 0);
    pushMatrix();
    drawTree(len*0.75, -30);
    popMatrix();
    pushMatrix();
    drawTree(len*0.66, 50);
    popMatrix();
  }
} // end drawTree()

