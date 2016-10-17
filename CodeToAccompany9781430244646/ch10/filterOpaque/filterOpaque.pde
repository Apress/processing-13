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
// filterOpaque.pde, chapter 10
// Demo of the OPAQUE filter

void setup() {
  PImage img = loadImage("bmc-logo.png");    // transparent logo
  PImage bg = loadImage("brynmawr.png");     // background image

  size(bg.width, bg.height);  
  background(bg);
  image(img, 0, 0);                   // original
  img.filter(OPAQUE);                 // opaque
  image(img, width-img.width, 0);
} // end setup()

