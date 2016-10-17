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
// blending.pde, chapter 10
// Different ways of blending of two images

void setup() {
  PImage src = loadImage("Lenna.png");        // blending image
  PImage dest = loadImage("prinzipal.jpg");   // background image
  size(dest.width, dest.height);              // size sketch window as background image
  background(dest);                           // load image into background

  blend(src, 0, 0, src.width, src.height, 0, 0, dest.width, dest.height, DARKEST);
  
  // variations, comment the blend() call above
  //blend(src, 0, 0, dest.width/2, src.height, 0, 0, dest.width/2, src.height, DARKEST);
  //blend(src, 0, 0, src.width, src.height, dest.width/2, 0, dest.width/2, src.height, DARKEST);
  //blend(src, 0, 0, dest.width/2, src.height, 0, height-src.height, dest.width/2, src.height, LIGHTEST);
  //blend(src, 0, 0, src.width, src.height, dest.width/2, height-src.height, dest.width/2, src.height, LIGHTEST);

  // variation with OVERLAY, comment all the blend() calls above
  //PImage src2 = loadImage("brynmawr.png");        // blending image
  //blend(src2, 0, 0, src.width, src.height, 0, 700, width, height-700, OVERLAY);
} // end setup()

