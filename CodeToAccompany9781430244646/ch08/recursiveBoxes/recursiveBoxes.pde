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
// recursiveBoxes.pde, chapter 8
// Recursivesly drawn squares

void setup() {
  size(800, 800);
  background(255);
  rectMode(CENTER);
  noFill();
  stroke(0);

  drawBox(width/2, height/2, width/2);
} // end setup()

// Draw boxes recursively, centered at cx, cy, with size d.
void drawBox(float cx, float cy, float d) {  
  strokeWeight(0.05*d);
  stroke(d, 0, d/2);
  
  // grayscale variation
  //strokeWeight(0.1*d);
  //stroke(d);
  
  rect(cx, cy, d, d);

  // Base case.
  if (d < 10) return;
  drawBox(cx-d/2, cy-d/2, d/2);
  drawBox(cx+d/2, cy-d/2, d/2);
  drawBox(cx-d/2, cy+d/2, d/2);
  drawBox(cx+d/2, cy+d/2, d/2);
} // end drawBoxes()

