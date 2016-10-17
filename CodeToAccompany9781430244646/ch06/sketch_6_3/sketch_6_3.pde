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

// Sketch 6-3: balls in a box
box b;
void setup() {
  size(400, 400);
  smooth();
  // Create a 200*200 box with 50 balls
  b = new box(100, 100, 200, 200, 50);
} // setup()
void draw() {
  background(255);
  // display the balls
  b.update();
  b.display();
} // draw()

