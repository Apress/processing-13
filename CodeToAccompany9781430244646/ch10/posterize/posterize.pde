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
// posterize.pde, chapter 10
// Demo of the POSTERIZE filter

void setup() {
  int n = 4;  // number of images displayed
  PImage img = loadImage("woods2.jpg");
  size(img.width*n, img.height);
  image(img, 0, 0);
  for (int i=1; i<n; i++) {
    img.filter(POSTERIZE, i+1);
    image(img, img.width*i, 0);
    img = loadImage("woods2.jpg");
  }
} // end setup()

