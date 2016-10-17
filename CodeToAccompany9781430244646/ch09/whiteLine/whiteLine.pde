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
// whiteLine.pde, chapter 9
// Draws a white line at the middle of the screen (height), 
// of a single pixel width.
void setup() {
  size(500, 500);
  background(0);
  loadPixels();

  for (int x = 0; x < width; x++) {
    pixels[height/2*width+x] = color(255);
  }

  updatePixels();
} // end setup() 

