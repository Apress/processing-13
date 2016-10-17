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
//recursiveTree.pde, chapter 8
//Recursively draws a tree
//This version does not use tranformations

void setup() {
  size(800, 800);
  background(255);
  stroke(156, 171, 61);
  drawTree(width/2, height, 175, 90);
} // end setup()

void drawTree(float x0, float y0, float len, float angle) {
  if (len > 2) {
    float x1 = x0 + cos(radians(angle))*len;
    float y1 = y0 - sin(radians(angle))*len;

    line(x0, y0, x1, y1);
    drawTree(x1, y1, len * 0.75, angle + 30);
    drawTree(x1, y1, len * 0.66, angle - 50);
    
    // variation 1
    //drawTree(x1, y1, len * 0.75, angle + 10);
    //drawTree(x1, y1, len * 0.66, angle - 50);
    
    // variation 2
    //change if condition to len > 10
    //drawTree(x1, y1, len * 0.75, angle + 20);
    //drawTree(x1, y1, len * 0.66, angle - 20);
  }
} // end drawTree()

