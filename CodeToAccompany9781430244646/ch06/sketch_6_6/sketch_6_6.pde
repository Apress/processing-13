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

// Sketch 6-6: widgets, discs, and hexagons

disc d;
hexagon h;
void setup() {
  size(500, 500);
  smooth();
  d = new disc();
  h = new hexagon();
} // setup()
void draw() {
  background(255);
  d.move();
  d.display();
  h.move();
  h.display();
} // draw()

