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
// bwGradient.pde, chapter 9 
// Draws a black to white gradient from top to bottom

void setup() {
  size(400, 400);

  // load colors into the pixels array
  loadPixels();

  // fill pixel array with a grayscale value
  // based on pixel array index
  for (int i=0; i<pixels.length; i++) {
    float gray = map(i, 0, pixels.length-1, 0, 255);
    pixels[i] = color(gray);
    // full color variation
    //float r = map(i, 0, width*height-1, 140, 100);
    //float g = map(i, 0, width*height-1, 20, 200);
    //float b = map(i, 0, width*height-1, 20, 10);
    //pixels[i] = color(r, g, b);
  }

  // update the sketch with pixel data
  updatePixels();
}

