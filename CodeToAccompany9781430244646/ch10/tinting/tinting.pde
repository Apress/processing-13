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
// tinting.pde, chapter 10
// Using the tint() function to create a Warhol collage

void setup() {
  PImage img = loadImage("Lenna.png");
  size(img.width*2, img.height*2);    // 2 times as wide as and 2 times as high as the original image 
  tint(200, 100, 0);                  // orange
  image(img, 0, 0);
  tint(0, 100, 200);                  // blue
  image(img, img.width, 0);           // display at x offset img.width
  tint(100, 100, 200);                // purple
  image(img, 0, img.height);
  tint(200, 200, 100);                // yellow
  image(img, img.width, img.height);
} // end setup()

