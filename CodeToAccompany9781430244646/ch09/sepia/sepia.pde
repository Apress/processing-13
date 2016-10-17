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
// sepia.pde, chapter 9
// Convert an image to Sepia tone

void setup() {
  PImage img = loadImage("Lenna.png");
  size(img.width, img.height);
  image(img, 0, 0);

  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    color c = pixels[i];
    
    float r = red(c)*0.393+green(c)*0.769+blue(c)*0.189;
    float g = red(c)*0.349+green(c)*0.686+blue(c)*0.168;
    float b = red(c)*0.272+green(c)*0.534+blue(c)*0.131;
   
    pixels[i] = color(r, g, b);
  }
  updatePixels();
}

