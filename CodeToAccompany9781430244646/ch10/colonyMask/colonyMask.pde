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
// colonyMask.pde, chapter 10
// Masking to blackout background of an image

void setup() {
  PImage img = loadImage("colony.tif");
  PImage msk = loadImage("mask.tif");
  background(0);
  size(img.width, img.height);
  img.mask(msk);
  image(img, 0, 0);
} // end setup()

