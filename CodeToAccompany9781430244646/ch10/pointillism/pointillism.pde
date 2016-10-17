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
// pointillism.pde, chapter 10
// Simulation of the pointillism effect by drawing many randomly sampled small dots

void setup() {
  PImage img = loadImage("pembroke.jpg");   
  size(img.width, img.height);   
  image(img, 0, 0);
  noStroke();
  loadPixels();          
  // Cover with random circles
  for (int i=0; i<10000; i++) {
    addPoint();
  }
}

void addPoint() {
  // Add a random filled circle to image
  int x = (int)random(width);
  int y = (int)random(height);
  int i = x + width*y;
  color c = pixels[i];
  fill(c);
  ellipse(x, y, 7, 7);
}


