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
// blackWhite2.pde, chapter 9
// Converts an image to grayscale, using image pixel buffer

void setup() {
  PImage img = loadImage("Lenna.png");
  size(img.width, img.height);

  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    img.pixels[i] = color(red(c)*0.299+green(c)*0.587+blue(c)*0.114);
  }
  img.updatePixels();
  image(img, 0, 0);
} // end setup()

