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
// pixelBufferMask.pde, chapter 10
// Applying the pixel buffer as a mask to an image

void setup() {
  PImage img = loadImage("prinzipal.jpg");
  size(img.width, img.height); 
  background(100, 130, 50);    // green
  for (int i=0; i<3000; i++) {
    rect(random(width), random(height), 5+random(20), 5+random(20));
    // circle variation
    //float r = 5+random(20);
    //noStroke();
    //ellipse(random(width), random(height), r, r);
  } 
  loadPixels();
  img.mask(pixels);
  image(img, 0, 0);
} // end setup()

