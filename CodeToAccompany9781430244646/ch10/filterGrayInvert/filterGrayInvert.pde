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
// filterGrayInvert.pde, chapter 10
// Demo of the GRAY and INVERT filters

void setup() {
  PImage[] imgs = new PImage[3];
  for (int i=0; i<imgs.length; i++) {
    imgs[i] = loadImage("woods2.jpg");
  }
  size(imgs[0].width*imgs.length, imgs[0].height);  // 3 times as wide as the original image 
  imgs[1].filter(GRAY);                             // grayscal
  imgs[2].filter(INVERT);                           // invert
  for (int i=0; i<imgs.length; i++) {
    image(imgs[i], imgs[0].width*i, 0);
  }  
} // end setup()

