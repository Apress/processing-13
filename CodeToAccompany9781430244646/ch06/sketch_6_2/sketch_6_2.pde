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

// Sketch: 6-2: Creating and displaying three ball objects
ball b1, b2, b3;
void setup() {
  size(400, 400);
  smooth();  
  // create the balls
  b1 = new ball();
  b2 = new ball();
  b3 = new ball();
} // setup()
void draw() {
  background(255);
  // display the balls
  b1.move();
  b1.display();
  b2.move();
  b2.display();
  b3.move();
  b3.display();
} // draw()

