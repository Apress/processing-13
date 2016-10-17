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
// recursiveCircles.pde, chapter 8
// Recursively drawn circles

void setup() {
  size(800, 800);
  background(255);
  smooth();
  noFill();

  translate(width/2, height/2);
  drawCircle(0, 0, width/2);
} //end setup()

//draw a circle of size s at x, y, s>2
void drawCircle(int x, int y, int s) {
  if (s>2) {
    ellipse(x, y, s, s);
    drawCircle(x-s/2, y, s/2);
    drawCircle(x+s/2, y, s/2);
    //drawCircle(x, y+s/2, s/2);
    //drawCircle(x, y-s/2, s/2);
  }
} //end drawCircle()

