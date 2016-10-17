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
// sepiaWithPalette.pde, chapter 9
// Convert an image to Sepia, with a palette

void setup() {
  color[] palette = new color[256];
  // yellow sepia
  int r = 255;
  int g = 240;
  int b = 192;
  // red sepia
  //int r = 255;
  //int g = 220;
  //int b = 192;

  for (int i=0; i<palette.length; i++) {
    palette[i] = color(r*i/255, g*i/255, b*i/255);
  }

  PImage img = loadImage("Lenna.png");
  size(img.width, img.height);
  image(img, 0, 0);

  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    color c = pixels[i];
    float gray = red(c)*0.299+green(c)*0.587+blue(c)*0.114; 
    pixels[i] = palette[int(gray)];
  }
  updatePixels();
}

