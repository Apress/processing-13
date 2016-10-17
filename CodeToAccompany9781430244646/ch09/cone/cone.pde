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
// cone.pde, chapter 9
// Draws a cone-shaped gradient from blue to orange

void setup() {
  size(400, 400);
  loadPixels();
  // Access pixels as a 2D array
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {     
      // Compute distance to center of sketch
      float distance = dist(x, y, width/2, height/2);
      //blue to orange
      float r = map(distance, 0, width/2, 20, 200);
      float g = map(distance, 0, width/2, 20, 100);
      float b = map(distance, 0, width/2, 140, 0);
      pixels[y*width+x] = color(r, g, b);
    }
  }
  updatePixels();
}// end setup()

